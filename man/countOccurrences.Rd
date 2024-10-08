% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/countOccurrences.R
\name{countOccurrences}
\alias{countOccurrences}
\title{Count Occurrences of Values in Database Tables}
\usage{
countOccurrences(v, tables, links, db_connection, cdm_schema, vocab_schema)
}
\arguments{
\item{v}{A vector of concept_ids to count occurrences for.}

\item{tables}{A character vector of CDM table names to search within.}

\item{links}{A list linking each table to its respective concept_id field.}

\item{db_connection}{A database connection object through which queries will be executed.}

\item{cdm_schema}{The database cdm_schema in which the tables are located.}

\item{vocab_schema}{The database vocab_schema in which the concept tables are located.}
}
\value{
A tibble with columns for the number of times any concept from 'v' occurs: direct count of persons, 
        direct count of records, descendant count of persons, and descendant count of records. 
        The tibble also includes the concept names derived from `v` and is arranged by the total 
        record count (direct + descendant).
}
\description{
This function counts the occurrences of specified concept ids within specified tables in a OMOP database, 
including direct occurrences and occurrences through descendants, based on a provided cdm_schema and links.
It returns a tibble summarizing the counts across persons and across records.
}
\examples{
# Assuming `db_connection` is a valid database connection, `cdm_schema` is set to "public",
# `tables` contains the names of the tables to search, `links` defines the relevant fields,
# and `v` contains the values to search for:
results <- countOccurrences(v = c(1, 2), tables = c("observation", "condition_occurrence"), 
                            links = list(observation = "observation_concept_id", condition_occurrence = "condition_concept_id", ...), 
                            db_connection = db_connection, cdm_schema = "public")

}
