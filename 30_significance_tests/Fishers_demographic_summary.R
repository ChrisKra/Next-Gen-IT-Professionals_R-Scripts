require(plyr)
require(dplyr)
require(gtsummary)

dem_by_cluster <- mat.ranking.bm_res[["assignment_mapped"]] %>% 
  select(cluster, 
         degree, 
         course, 
         semester, 
         work, 
         age, 
         gender, 
         university
         ) %>% 
  dplyr::rename(
    Degree = degree, 
    Course = course, 
    Semester = semester, 
    Work = work, 
    Age = age, 
    Gender = gender, 
    University = university
  ) %>%
  mutate(Course = revalue(Course, c("Data Engineering/ Data Science (or similar)"="Technically oriented", 
                                    "Informatics / Computer Science (or similar)"="Technically oriented", 
                                    "Informatics: Games Engineering"="Technically oriented",
                                    "Mathematics (or similar)"="Technically oriented",
                                    "Physics (or similar)"="Technically oriented",
                                    "Robotics, Cognition, Intelligence"="Technically oriented",
                                    "Human-Computer-Interaction"="Mixed",
                                    "Information Systems"="Mixed",
                                    "Media Informatics"="Mixed",
                                    "Teacher Training: Naturwissenschaftliche Bildung/Berufliche Bildung (de)"="Mixed",
                                    "Other"="Mixed",
                                    "Finance and Information Management (FIM)"="Mangement oriented",
                                    "Technology & Management (oder Ähnliches)"="Mangement oriented"
                                    ))) %>%
  mutate(Semester = revalue(Semester, c("1"="1.-2. Semester", 
                                    "2"="1.-2. Semester", 
                                    "3"="3.-4. Semester", 
                                    "4"="3.-4. Semester", 
                                    "5"="5.-6. Semester", 
                                    "6"="5.-6. Semester",
                                    ">6"="7.-... Semester"
  ))) %>%
  mutate(Degree = factor(Degree, levels = c("Bachelor's Degree", "Master's Degree", "Doctoral Degree", "Other"))) %>% 
  mutate(Course = factor(Course, levels = c("Technically oriented", "Mixed", "Mangement oriented"))) %>% 
  mutate(Work = factor(Work, levels = c("Yes", "No", "N/A"))) %>% 
  mutate(University = factor(University, levels = c("Technical University of Munich (TUM)", "Ludwig Maximilian University of Munich (LMU)", "Munich University of Applied Sciences (HM)", "Other"))) %>% 
  tbl_summary(by = cluster) %>% 
  add_p(test = everything() ~ "fisher.test", 
        test.args = list(Course ~ list(workspace = 2e8, simulate.p.value=TRUE), 
                         Semester ~ list(workspace = 2e8, simulate.p.value=TRUE), 
                         Age ~ list(workspace = 2e8, simulate.p.value=TRUE))) %>%
  separate_p_footnotes() 

dem_by_cluster

write.csv(as_tibble(dem_by_cluster))
