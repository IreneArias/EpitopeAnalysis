#' epitopeAnalysis
#'
#' @return
#' @export
#'
#' @examples "YTMSLGAEN"
#' @examples "MSLGAENSVA"
#' @examples "TMSLGAENSVAY"
epitope_Analysis <- function() {
  path <- getwd()
  data_path <- paste(path,sep = "/")
  files <- Sys.glob(file.path(data_path, "*.txt"))
  `%nin%` = Negate(`%in%`)

  all_possibilities <- function(list_,min_size,max_size) {
    all <- list()
    for (ele in list_){
      for (i in  min_size:max_size){
        for (j in  0:max_size-min_size){
          part <- substr(ele,i-min_size,i+j)
          if (nchar(part) >= min_size){
            if (part %nin% all){
              all <- append(all,part)
            }
          }
        }
      }
    }
    return(all)
  }

  present_in_epitope <- function(seq,seq_list){
    result <- 0
    for (epi in seq_list){
      tmp <- grepl(seq, epi, fixed = TRUE)
      if (tmp == TRUE){
        result <- 1
      }
    }
    return(result)
  }

  list_ <- list()

  for (file in files) {
    tmp <- read.table(file,header=FALSE)
    list_ <- append(list_,tmp)
  }

  smallest <- 1e10
  largest <- 0

  all_seq = unlist(list_,use.names = FALSE)

  freq_x <- sort(table(unlist(strsplit(all_seq, ""))))

  for (seq in all_seq){
    size = nchar(seq)
    if (size >= largest) {
      largest <- size
    }
    if (size <= smallest) {
      smallest <- size
    }
  }



  sprintf("The shortest sequence found is: %s", smallest)
  sprintf("The largest sequence found is: %s", largest)

  all <- all_possibilities(all_seq,smallest,largest)
  print(length(all))
  number_of_files <- length(files)
  sprintf("The number of files found are: %s", number_of_files)

  for (seq in all){
    result <- list()
    for (sub_list in list_){
      tmp <- present_in_epitope(seq,sub_list)
      if (tmp == 1){
        result <- append(result,tmp)
      }
    }
    if (length(result) == number_of_files){
      sort.list(seq, na.last=TRUE)
      print(seq)
    }
  }
}




