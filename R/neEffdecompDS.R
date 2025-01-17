#'
#' @title Linear hypotheses for natural effect models
#' @description This function is similar to R function \code{neEffdecomp} from the
#' \code{medflex} package.
#' @details The function \code{ds.neEffdecomp} automatically extracts relevant causal
#' parameter estimates from a natural effect model.
#' @param model.name the name of a fitted natural effect model object. This is the
#' object saved on the server-side by the \code{ds.neModel} function.
#' @return a summary table of the object of class c("neLht", "glht") (see glht). The object
#' additionally inherits from class "neEffdecomp".
#' @author Demetris Avraam, for DataSHIELD Development Team
#' @export
#'
neEffdecompDS <- function(model.name) {
  # evaluate the object 'model.name' provided as character on the client side
  model <- eval(parse(text = model.name), envir = parent.frame())

  # COMMENTED THE CODE BELOW BUT CAN BE MODIFIED AND INCLUDED IN A NEXT RELEASE
  # if(!is.null(xRef)){
  #   xRef <- unlist(strsplit(xRef, split=","))
  # }else{
  #   xRef <- xRef
  # }
  #
  #
  # if(!is.null(covNames)){
  #   covNames <- unlist(strsplit(covNames, split=","))
  # }else{
  #   covNames <- covNames
  # }
  #
  # if(!is.null(covLev)){
  #   covLev <- unlist(strsplit(covLev, split=","))
  # }else{
  #   covLev <- covLev
  # }
  #
  # covLev.use <- c()
  # for(i in 1:length(covNames)){
  #   covLev.use[i] <- paste(as.name(covNames[i]), '=', covLev[i])
  # }

  neEffdecomp.out <- medflex::neEffdecomp(model = model)
  out <- summary(neEffdecomp.out)
  return(out)
}
