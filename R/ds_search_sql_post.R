#' Datastore - search or get a dataset from CKRAN datastore
#'
#' @export
#'
#' @param sql (character) A single SQL select statement. (required)
#' @template args
#' @examples \dontrun{
#' url <- 'https://demo.ckan.org/'
#' sql <- 'SELECT * from "f4129802-22aa-4437-b9f9-8a8f3b7b2a53" LIMIT 2'
#' ds_search_sql_post(sql, url = url, as = "table")
#' sql2 <- 'SELECT "Species","Genus","Family" from "f4129802-22aa-4437-b9f9-8a8f3b7b2a53" LIMIT 2'
#' ds_search_sql_post(sql2, url = url, as = "table")
#' }
#' @importFrom httr status_code

ds_search_sql_post <- function(sql, url = get_default_url(), as = 'list',
                               config = httr::add_headers(Authorization=get_default_key(), `Content-Type`='application/json'), ...) {
  body <- ckanr:::tojun(ckanr:::cc(list(sql=sql)), TRUE)
  res <- httr:::POST(file.path(notrail(url), "api/action/datastore_search_sql"), config,
                     body=body, encode="json")
  httr:::stop_for_status(res, task=sql)
  res <- content(res, "text", encoding = "UTF-8")
  switch(as, json = res, list = jsl(res), table = jsd(res))
}
