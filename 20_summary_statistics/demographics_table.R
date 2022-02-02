df.transposed %>% 
  select(IN01, 
         IN02, 
         IN03, 
         IN04, 
         DD1, 
         DD2, 
         DD3
         ) %>%
  rename(
    Degree = IN01, 
    Course = IN02, 
    Semester = IN03, 
    Work = IN04, 
    Age = DD1, 
    Gender = DD2, 
    University = DD3
  ) %>%
  mutate(Degree = factor(Degree, levels = c("Bachelor's Degree", "Master's Degree", "Doctoral Degree", "Other"))) %>% 
  mutate(Semester = factor(Semester, levels = c("1", "2", "3", "4", "5", "6", ">6"))) %>% 
  mutate(Work = factor(Work, levels = c("Yes", "No", "N/A"))) %>% 
  mutate(University = factor(University, levels = c("Technical University of Munich (TUM)", "Ludwig Maximilian University of Munich (LMU)", "Munich University of Applied Sciences (HM)", "Other"))) %>% 
  tbl_summary(sort = list(Course ~ "frequency")) %>% 
  #   tbl_summary(by = Gender) %>% 
  #   add_n() %>%
  bold_labels() 