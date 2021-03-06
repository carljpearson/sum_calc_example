#method from MeasuringU.com https://measuringu.com/sum-2/

#load packages

library(tidyverse) #all data wrangling/plotting
library(psych) #just for the geometric averaging

#preparation: here we get the data and add our own extra data like time specs and color choices for plots -----

  #get sample fake data -----

df <- structure(list(par = c(1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 3L, 3L, 
                             3L, 3L, 4L, 4L, 4L, 4L, 5L, 5L, 5L, 5L, 6L, 6L, 6L, 6L, 7L, 7L, 
                             7L, 7L, 8L, 8L, 8L, 8L, 9L, 9L, 9L, 9L, 10L, 10L, 10L, 10L, 11L, 
                             11L, 11L, 11L, 12L, 12L, 12L, 12L, 13L, 13L, 13L, 13L, 14L, 14L, 
                             14L, 14L, 15L, 15L, 15L, 15L, 16L, 16L, 16L, 16L, 17L, 17L, 17L, 
                             17L, 18L, 18L, 18L, 18L, 19L, 19L, 19L, 19L, 20L, 20L, 20L, 20L, 
                             21L, 21L, 21L, 21L, 22L, 22L, 22L, 22L, 23L, 23L, 23L, 23L, 24L, 
                             24L, 24L, 24L, 25L, 25L, 25L, 25L, 26L, 26L, 26L, 26L, 27L, 27L, 
                             27L, 27L, 28L, 28L, 28L, 28L, 29L, 29L, 29L, 29L, 30L, 30L, 30L, 
                             30L, 31L, 31L, 31L, 31L, 32L, 32L, 32L, 32L, 33L, 33L, 33L, 33L, 
                             34L, 34L, 34L, 34L, 35L, 35L, 35L, 35L, 36L, 36L, 36L, 36L, 37L, 
                             37L, 37L, 37L, 38L, 38L, 38L, 38L, 39L, 39L, 39L, 39L, 40L, 40L, 
                             40L, 40L), task = c(1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 
                                                 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 
                                                 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 
                                                 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 
                                                 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 
                                                 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 
                                                 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 
                                                 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 
                                                 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 
                                                 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, 1L, 2L, 3L, 
                                                 4L, 1L, 2L, 3L, 4L), group = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
                                                                                1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
                                                                                1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 
                                                                                2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 
                                                                                2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
                                                                                1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
                                                                                1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 
                                                                                2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 
                                                                                2, 2, 2), comp = c(1L, 1L, 0L, 1L, 1L, 1L, 0L, 0L, 1L, 0L, 1L, 
                                                                                                   1L, 1L, 1L, 0L, 0L, 1L, 1L, 0L, 0L, 0L, 1L, 1L, 0L, 1L, 0L, 0L, 
                                                                                                   0L, 1L, 1L, 0L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 0L, 1L, 1L, 1L, 1L, 
                                                                                                   0L, 1L, 0L, 0L, 0L, 1L, 1L, 0L, 1L, 1L, 1L, 1L, 0L, 1L, 1L, 0L, 
                                                                                                   0L, 1L, 1L, 0L, 0L, 1L, 1L, 0L, 0L, 1L, 1L, 1L, 1L, 1L, 1L, 0L, 
                                                                                                   0L, 1L, 1L, 1L, 1L, 1L, 1L, 0L, 1L, 1L, 1L, 0L, 0L, 1L, 1L, 0L, 
                                                                                                   0L, 0L, 1L, 0L, 0L, 1L, 1L, 0L, 1L, 1L, 0L, 1L, 0L, 1L, 1L, 0L, 
                                                                                                   0L, 1L, 1L, 0L, 0L, 0L, 1L, 0L, 1L, 1L, 0L, 1L, 1L, 1L, 1L, 1L, 
                                                                                                   0L, 1L, 1L, 0L, 0L, 1L, 1L, 0L, 0L, 1L, 1L, 1L, 0L, 1L, 1L, 0L, 
                                                                                                   1L, 1L, 1L, 0L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 0L, 0L, 1L, 1L, 1L, 
                                                                                                   1L, 1L, 1L, 1L, 0L), sat = c(4.2, 4.4, 1.2, 4.4, 3.9, 3.9, 1.6, 
                                                                                                                                1, 4.2, 1.6, 3.9, 3.5, 4.7, 3.8, 2.3, 1.8, 3.6, 4.7, 1.4, 2.5, 
                                                                                                                                2.3, 4, 3.9, 1, 4.2, 1.9, 2.5, 1, 4.2, 4.4, 1.9, 3.5, 3.9, 3.9, 
                                                                                                                                4, 4.7, 3.9, 3.6, 2.5, 4.4, 4.4, 4.2, 4.3, 1.2, 4.4, 1.6, 1.2, 
                                                                                                                                2.7, 4.7, 4.2, 1.2, 4.6, 4.3, 3.6, 3.8, 1.2, 4.3, 3.6, 1, 1.6, 
                                                                                                                                3.8, 3.8, 1.6, 1.4, 3.5, 3.8, 1.4, 2.5, 4.4, 4, 4.7, 4.2, 3.9, 
                                                                                                                                3.9, 2.3, 1.6, 4.2, 3.5, 4.6, 3.6, 3.8, 4.4, 1, 3.9, 4.4, 3.6, 
                                                                                                                                2.3, 1.6, 3.9, 4.4, 1.2, 1.6, 1.4, 4, 2.7, 2.1, 4.4, 3.9, 1.4, 
                                                                                                                                4.4, 4.2, 2.1, 3.9, 1.8, 4.7, 3.9, 1, 1.6, 3.9, 4.3, 1.6, 2.5, 
                                                                                                                                2.1, 3.9, 2.1, 4.7, 4, 1.9, 4.6, 3.9, 3.8, 3.8, 3.5, 2.1, 4.6, 
                                                                                                                                4.2, 2.5, 1.9, 3.5, 4.2, 1.4, 1.9, 4.7, 3.5, 4, 2.5, 4.3, 4.2, 
                                                                                                                                1.6, 3.9, 4.6, 4, 2.5, 4.4, 4.2, 3.9, 4.6, 4, 4, 4.7, 2.7, 1.4, 
                                                                                                                                3.8, 4.2, 4.2, 3.8, 4.3, 4.2, 4.6, 1.6), time = c(30.5, 122.5, 
                                                                                                                                                                                  348.9, 726.7, 29.9, 140.9, 344.9, 606.2, 71.6, 51.4, 549.1, 667.2, 
                                                                                                                                                                                  84.1, 42.3, 796.6, 408.6, 38.7, 173.7, 715.7, 385.5, 75.9, 194.6, 
                                                                                                                                                                                  293.7, 311.9, 94.6, 204.9, 423.4, 464, 53.3, 155.1, 887.9, 451.4, 
                                                                                                                                                                                  64.3, 61.6, 909.5, 323.8, 42.6, 186.7, 348.9, 391.1, 65.4, 101.2, 
                                                                                                                                                                                  480.6, 623, 77.2, 122.8, 398.7, 931.3, 61.9, 67.3, 82.5, 838.1, 
                                                                                                                                                                                  30.4, 116.3, 487.2, 837.4, 87.6, 91.5, 379.3, 660.9, 93.1, 106.9, 
                                                                                                                                                                                  333.1, 801, 73.6, 125.2, 235.3, 694.5, 56.5, 62.6, 473.1, 999.3, 
                                                                                                                                                                                  29.7, 103.7, 216.4, 813.6, 56.5, 68.1, 496.5, 897, 64.1, 205.9, 
                                                                                                                                                                                  984.8, 535.4, 80.1, 109.9, 227.2, 726.7, 52.2, 218.4, 971.2, 
                                                                                                                                                                                  346.2, 45, 55.5, 925.5, 468.9, 66.6, 185.6, 260.1, 669.3, 52.6, 
                                                                                                                                                                                  175, 401, 965, 88.2, 155.9, 357, 702.9, 34.1, 111.5, 804.6, 431, 
                                                                                                                                                                                  89.8, 83.4, 532.3, 920.8, 32, 215.3, 495.5, 302.8, 52.9, 38.9, 
                                                                                                                                                                                  481.9, 309.1, 45.9, 31.2, 330.4, 866.9, 30.4, 129.2, 401.3, 741.4, 
                                                                                                                                                                                  28.3, 43.3, 299.2, 697.3, 82.5, 135.2, 456.4, 664.4, 53.8, 94.1, 
                                                                                                                                                                                  126.5, 700.1, 99.3, 33.1, 137.5, 621.6, 67.9, 93.8, 213.3, 508.8, 
                                                                                                                                                                                  95.2, 70.4, 155.6, 576.8, 82.6, 132.9, 112.9, 687.5)), .Names = c("par", 
                                                                                                                                                                                                                                                    "task", "group", "comp", "sat", "time"), row.names = c(NA, -160L
                                                                                                                                                                                                                                                    ), class = "data.frame")

  #renaming key SUM vars so we don't have to recode -----

colnames(df) #view col names to rename
df %>% rename(
  task=task, #task identifier
  par=par, #participant identifer
  time=time, #task time
  comp=comp, #task completion
  sat=sat #satisfaction average ratings
) -> df

#how many tasks did you test?
task_num <- 4

  #choose our z value

zval <- 1.64 #z value at 90% confidence, if you change, adjust plot subtitles

#color palette for plot
c(
  "#3B0083",
  "#00b9e4",
  "#007a87",
  "#ec7a08",
  "#92d400",
  "#f0ab00"
) -> colpal

  #get time specs

df %>% 
    filter(sat>=4) %>% #satisfaction above 4/5
    filter(comp==1) %>% #completed tasks only
    select(par,task,time) %>% #remove unneeded variables
    spread(task,time) %>% #widen data for loop of quantile calculation
    select(-par) -> time.quantiles #remove participant var and save
lapply(time.quantiles, quantile, #quantile function
       probs=seq(0, 1, by= 0.1), #provide sequence for granularity of quantiles
       name=FALSE, #no col names
       na.rm=T #remove NAs (sat < 4/5 and not completed)
       ) -> my_quants
names(my_quants) <- c(paste("Task",1:task_num)) #add col names
my_quants <- data.frame(my_quants) #make into a df


#use this plot to help specifiy your time spec
my_quants %>% 
  mutate(quantile=c(seq(0,1,by=.1))) %>% #provide quantile key variable
  gather(task,time,-quantile) %>% #elongate data
  mutate(quantile=as.factor(quantile)) -> my_quants_long #quantile needs to be factor for graphing, save
  ggplot(my_quants_long,aes(x=quantile,y=time,fill=quantile)) + #plot time across quantiles
  geom_bar(stat="identity") + #bar graph
  theme_minimal() +
  scale_fill_manual(values=c(rep("gray",8),"blue",rep("gray",2))) + #custom colors to make .8 bar stand out
  guides(fill=FALSE) + 
  scale_x_discrete(breaks=c(seq(0,1,by=.1)))+ #x axis ticks
  facet_wrap(~task, scales="free") #each task has its own plot



#manually add time specifications based on graph data or pre-existing product decisions
df$tspec[df$task==1] <- 60
df$tspec[df$task==2] <- 60
df$tspec[df$task==3] <- 120
df$tspec[df$task==4] <- 300
#df$tspec[df$task==5] <- 4
#df$tspec[df$task==6] <- 2



#data analysis: everything is now in place to begin to summarise and calculate -----


  #create completion df ----
df %>%
  group_by(group,task) %>% #group analyses broadly by product/version group and then by each task
  summarise(pass=sum(comp),n=n()) %>% #get n successes and n trials
  mutate(prop = pass / n) %>% #exact proportion from succesess/trials
  mutate(laplace = (pass + 1) / (n + 2)) %>% #laplace point estimate
  mutate(p_adj = (n * prop + (zval * zval) / 2) / (n + (zval * zval))) %>% #adjust p for wald calculation
  mutate(n_adj = n + (zval * zval)) %>% #adjust n for wald calculation
  mutate(marg =  zval * sqrt(p_adj * (1 - p_adj) / n_adj)) %>% #wald margin value
  mutate(lowerci = p_adj - marg) %>% #lower wald ci
  mutate(lowerci = ifelse(lowerci <= 0, 0, lowerci)) %>% #keep lower ci above 0
  mutate(upperci = p_adj + marg) %>% #upper wald ci
  mutate(upperci = ifelse(upperci >= 1, 1, upperci)) %>% #keep upper ci below 1
  mutate(point_est.z = laplace ) %>% #z score transform based on .78 baseline and bernouli variance
  mutate(lowerci.z= lowerci ) %>% #z score transform for conf intervals
  mutate(upperci.z = upperci ) %>% #z score transform for conf intervals
  mutate(point_est.nps=(point_est.z - .5) * 200)%>% #nps-ify
  mutate(lowerci.nps=(lowerci.z- .5 )* 200)%>% #nps-ify
  mutate(upperci.nps=(upperci.z- .5 )* 200)%>% #nps-ify
  rename(point.est=laplace) %>% mutate(Measure="Completion") %>% #name measure as var
  mutate(spec=.78 #define spec var for raw plots
  )-> df_comp

  #create satisfaction df -----
df %>%
  group_by(group,task) %>% #group analyses broadly by product/version group and then by each task
  na.omit() %>%
  summarise(mean=mean(sat),sd=sd(sat),n=n()) %>% #get means, std deviation, and total observations
  mutate(se=(sd / sqrt(n))) %>% #std error
  mutate(marg=se*zval) %>% #margin of error based on zval
  mutate(lowerci=mean-marg) %>% #lower ci
  mutate(lowerci = ifelse(lowerci <= 0, 0, lowerci)) %>% #keep lower ci above 0
  mutate(upperci=mean+marg) %>% #upper ci
  mutate(upperci = ifelse(upperci >= 5, 5, upperci)) %>% #keep upper ci below max
  mutate(point_est.z = pnorm((mean - 4)/sd)) %>% #z transform based on sd
  mutate(lowerci.z=pnorm((lowerci-4)/sd)) %>%  #z transform lower ci
  mutate(upperci.z=pnorm((upperci-4)/sd)) %>% #z transform upper ci
  mutate(point_est.nps=(point_est.z - .5) * 200) %>% #nps-ify
  mutate(lowerci.nps=(lowerci.z- .5 )* 200)%>% #nps-ify
  mutate(upperci.nps=(upperci.z- .5 )* 200)%>% #nps-ify
  mutate(Measure="Satisfaction") %>% #name measure as var
  mutate(spec=4) %>% #define spec var for raw plots
  rename(point.est=mean) -> df_sat

  #create time df -----
df %>%
  filter(comp==1) %>% #only completed tasks
  group_by(group,task,tspec) %>% #group analyses broadly by product/version group and then by each task, including task time spec
  summarise(mean=geometric.mean(time),sd = sd(time),n=n()) %>% #get mean, sd and n
  mutate(se=(sd / sqrt(n))) %>% #calculate std error
  mutate(marg=se*zval) %>% #calculate margin of error
  mutate(lowerci=mean-marg) %>% #lower ci
  mutate(lowerci = ifelse(lowerci <= 0, 0, lowerci)) %>% #keep lower ci above 0
  mutate(upperci=mean+marg) %>% #upper ci
  mutate(point_est.z = 1-pnorm((mean - tspec)/sd)) %>% #reverse proportion of z
  mutate(upperci.z=1-pnorm((lowerci-tspec)/sd)) %>% #upperci comes from lowerci after inversion
  mutate(lowerci.z=1-pnorm((upperci-tspec)/sd)) %>% #opposite as ^
  mutate(point_est.nps=(point_est.z - .5) * 200)%>% #nps-ify
  mutate(lowerci.nps=(lowerci.z- .5 )* 200)%>% #nps-ify
  mutate(upperci.nps=(upperci.z- .5 )* 200)%>%# nps-ify
  rename(point.est=mean,spec=tspec) %>% #rename some variables to fit into bind_rows
  mutate(Measure="Time") -> df_time

  #combining all dfs to sub measure summary
bind_rows(df_comp,df_sat,df_time) -> df_summarised #df from row bind
df_summarised$task <- as.factor(df_summarised$task)

#add better labels for task var, mainly used for plotting but function as factor variable
df_summarised$task_named[df_summarised$task==1] <- "Task 1: Start Function A"
df_summarised$task_named[df_summarised$task==2] <- "Task 2: Start Function B"
df_summarised$task_named[df_summarised$task==3] <- "Task 3: Combine Functions"
df_summarised$task_named[df_summarised$task==4] <- "Task 4: Debug"
#df_summarised$task_named[df_summarised$task==5] <- "Task 5: "
#df_summarised$task_named[df_summarised$task==6] <- "Task 6: "

  #Task level summaries from summarised df of submeasures
df_summarised %>% 
  group_by(group,task) %>% #keep product/versions separate, and only aggregate at task level
  summarise(point_est.z=mean(point_est.z), #average of point estimate std values
            lowerci.z=mean(lowerci.z), #average of lower CI std values
            upperci.z=mean(upperci.z), #average of upper CI std values
            point_est.nps=mean(point_est.nps), #average of pointe estimate NPS-like values
            lowerci.nps=mean(lowerci.nps), #average of lower CI NPS-like values
            upperci.nps=mean(upperci.nps) #average of upper CI NPS-like values
  ) %>%
  mutate(task=as.factor(task)
         )-> df_task
#add better labels for task var
df_task$task_named[df_task$task==1] <- "Task 1: Start Function A"
df_task$task_named[df_task$task==2] <- "Task 2: Start Function B"
df_task$task_named[df_task$task==3] <- "Task 3: Start Function C"
df_task$task_named[df_task$task==4] <- "Task 4: Start Fuction D"
#df_task$task_named[df_task$task==5] <- "Task 5: "
#df_task$task_named[df_task$task==6] <- "Task 6: "

  #Overall SUM value
df_summarised %>%
  group_by(group) %>% #keep products separate
  summarise(point_est.z=mean(point_est.z), #average point estimates
            lowerci.z=mean(lowerci.z), #average lower CI
            upperci.z=mean(upperci.z)) %>% #average upper CI
  data.frame() %>% 
  group_by(group) %>%
  summarise(mean=mean(point_est.z), 
            sd=sd(point_est.z),
            n=n(),
            lowerci.z=mean(lowerci.z),
            upperci.z=mean(upperci.z)) %>%
  mutate(se=(sd / sqrt(n))) %>%
  mutate(marg=se*zval) %>%
  mutate(lowerci.grand=mean-marg) %>%
  mutate(lowerci.grand = ifelse(lowerci.grand <= 0, 0, lowerci.grand)) %>%
  mutate(upperci.grand=mean+marg) %>%
  mutate(upperci.grand = ifelse(upperci.grand >= 5, 5, upperci.grand)) %>%
  mutate(group=as.factor(group)) %>%
  rename(point_est.z=mean)%>%
  mutate(point_est.nps=(point_est.z - .5) * 200)%>%
  mutate(lowerci.nps=(lowerci.z- .5 )* 200)%>%
  mutate(upperci.nps=(upperci.z- .5 )* 200) %>%
  select(group=group,
         final_SUM=point_est.nps,
         final_SUM_low=lowerci.nps,
         final_SUM_hi=upperci.nps,
         final_SUM_perc=point_est.z,
         final_SUM_perc_low=lowerci.z,
         final_SUM_perc_hi=upperci.z
         ) -> df_SUM




#Plotting: we can now create data visualizations with our submeasure data, task level data, and final data ------

#these plots are for only one version (you can run these before you finish part II)

  #raw measures
#completion
df_summarised %>% 
  filter(group==1) %>% #choose grouping
  filter(Measure=="Completion") %>% #only completion
  ggplot(aes(x=task, y=point.est,ymin=lowerci, ymax=upperci, fill=task_named)) +  #vars to be plotted
  geom_bar(position=position_dodge(), stat="identity") + #make a bar plot with color palette
  geom_abline(intercept=.78,slope=0, color = "gray",linetype = 2, size=2) + #horizontal benchmark line
  coord_cartesian(ylim=c(0,1)) + #limit y axis between 0-1
  geom_errorbar(position=position_dodge(), stat="identity",color="darkgray",width=.2) + #error bar geom and sizing
  scale_y_continuous(labels = scales::percent) + #make y labels in percentage
  labs(x="Task", y="Estimated proportion") + #explicit axis labels
  ggtitle(label = "Estimated completion rates across all tasks", #title of graph
          subtitle = "Confidence intervals at 90%, gray line indicates benchmark") + #subtitle of graph
  ggthemes::theme_tufte(base_family="GillSans") + #tufte theming (max dataink) with sans serif font
  scale_fill_manual(values=colpal)+
  guides(fill=guide_legend(title="Task Legend"))+
  theme(
    axis.text.x = element_text(size = 15)
    ) -> p.comp_raw

ggsave(
  "plot_comp_raw.png",
  plot = p.comp_raw,
  device = "png",
  bg =  "transparent",
  width = 8,
  height = 5)

#satisfaction
df_summarised %>%
  filter(group==1) %>%
  filter(Measure=="Satisfaction") %>%
  ggplot(aes(x=task, y=point.est,ymin=lowerci, ymax=upperci,fill=task_named)) + 
  geom_bar(position=position_dodge(), stat="identity") +
  geom_abline(intercept=4,slope=0, color = "gray",linetype = 2, size=2)+
  coord_cartesian(ylim=c(1,5)) +
  geom_errorbar(position=position_dodge(), stat="identity",color="darkgray",width=.2) +
  labs(x="Task", y="Satisfaction score") +
  ggtitle(label = "Average satisfaction measure scores across all tasks",
          subtitle = "Confidence Intervals at 90%, gray line indicates benchmark") +
  guides(fill=FALSE) +
  ggthemes::theme_tufte(base_family="GillSans") + 
  scale_fill_manual(values=colpal)+
  guides(fill=guide_legend(title="Task Legend"))+
  theme(
    axis.text.x = element_text(size = 15),
    axis.title.x = element_blank()
    ) -> p.sat_raw #save object

ggsave(
  "plot_sat_raw.png",
  plot = p.sat_raw,
  device = "png",
  bg =  "transparent",
  width = 8,
  height = 5)

#time
df_summarised %>%
  filter(group==1) %>%
  filter(Measure=="Time") %>%
  group_by(task) %>%
  ggplot(aes(x=task, y=point.est,fill=task_named,ymin=lowerci, ymax=upperci)) + 
  geom_bar(position=position_dodge(), stat="identity") +
  geom_errorbar(aes(ymax=spec,ymin=spec),position=position_dodge(), stat="identity", color = "#3C3C3C",linetype = 2, size=2)+
  #coord_cartesian(ylim=c(0,1)) +
  geom_errorbar(position=position_dodge(), stat="identity",color="darkgray",width=.2) +
  labs(x="Task", y="Time geometric average in seconds") +
  ggtitle(label = "Raw time averages across all tasks",
          subtitle = "Confidence Intervals at 90%, gray lines indicate benchmark") +
  #scale_y_time(labels=date_labels("%M $S"))+
  facet_grid(.~task, scales="free")+
  ggthemes::theme_tufte(base_family="GillSans") + 
  scale_fill_manual(values=colpal)+
  guides(fill=guide_legend(title="Task Legend"))+
  theme(
    axis.text.x = element_text(size = 15),
    axis.title.x = element_blank(),
    legend.position="none",
    strip.background = element_blank(), #remove face label area
    strip.text.x = element_blank() #remove facet label text
  ) -> p.time_raw

ggsave(
  "plot_time_raw.png",
  plot = p.time_raw,
  device = "png",
  bg =  "transparent",
  width = 8,
  height = 5)

  #standardized measures
#all sub scores on all tasks
df_summarised %>%
  filter(group==1) %>%
  group_by(task_named) %>%
  mutate(vjust_value=ifelse(point_est.nps<6,-.4,1.4)) %>%
  ggplot(aes(x=Measure, y=point_est.nps,fill=task_named,ymin=lowerci.nps, ymax=upperci.nps)) + 
  geom_bar(position=position_dodge(), stat="identity") +
  coord_cartesian(ylim=c(-100,100)) +
  geom_errorbar(position=position_dodge(), stat="identity",color="gray",width=.2) +
  #geom_abline(intercept=.5,slope=0, color = "gray",linetype = 2, size=2) +
  geom_text(aes(label = round(point_est.nps,0),hjust = 1.2,vjust=vjust_value,y=0), size = 3, position = "identity") +
  # scale_y_continuous(breaks=c(0:3)) +
  labs(x="", y="Standard score") +
  ggtitle(label = "Standardized Scores for All Tasks",
          subtitle = "Confidence Intervals at 90%") +
  ggthemes::theme_tufte(base_family="GillSans") + 
  scale_fill_manual(values=colpal)+
  theme(
    #axis.text.x = element_text(size = 15),
    #axis.text.y = element_text(size = 15),
    #axis.title.x = element_text(size = 15),
    #axis.title.y = element_text(size = 15),
    #title = element_text(size = 18),
    legend.position="none") +
  facet_grid(.~task_named) -> p.all_subtasks_nps

ggsave(
  "plot_all_subtask_nps.png",
  plot = p.all_subtasks_nps,
  device = "png",
  bg =  "transparent",
  width = 10,
  height = 5)


  #loop individual tasks nps


for(i in 1:task_num){
  

  
  col <- colpal[i]  
  
  df_summarised %>%
    filter(group==1) %>%
    filter(task==i) %>%
    mutate(vjust_value=ifelse(point_est.nps<6,-.4,1.4)) %>%
    mutate(point_est.z=(point_est.z - .5) * 200)%>%
    mutate(lowerci.z=(lowerci.z- .5 )* 200)%>%
    mutate(upperci.z=(upperci.z- .5 )* 200)%>%
    ggplot(aes(x=Measure, y=point_est.z,fill=task_named,ymin=lowerci.z, ymax=upperci.z)) + 
    geom_bar(position=position_dodge(), stat="identity") +
    coord_cartesian(ylim=c(-100,100)) +
    geom_errorbar(position=position_dodge(), stat="identity",color="gray",width=.2) +
    #geom_abline(intercept=.5,slope=0, color = "gray",linetype = 2, size=2) +
    geom_text(aes(label = round(point_est.z,0),hjust = 2,vjust=vjust_value,y=0), size = 5, position = "identity",color="black") +
    # scale_y_continuous(breaks=c(0:3)) +
    labs(x="", y="Standard score") +
    ggtitle(label = paste0("Standardized Subscores for Task ",i),
            subtitle = "Confidence Intervals at 90%") +
    ggthemes::theme_tufte(base_family="GillSans") + 
    scale_fill_manual(values=col)+
    theme(
      axis.text.x = element_text(size = 15),
      axis.text.y = element_text(size = 15),
      axis.title.x = element_text(size = 15),
      axis.title.y = element_text(size = 15),
      title = element_text(size = 15),
      legend.position="none") -> p.tasktemp_nps
  
  ggsave(
    paste0("plot_task,",i,"_nps_small.png"),
    plot = p.tasktemp_nps,
    device = "png",
    bg =  "transparent",
    width = 8,
    height = 5)
} #end loop here

#nps version task summary
df_task %>%
  filter(group==1) %>%
  mutate(vjust_value=ifelse(point_est.nps<6,-.4,1.4)) %>%
  ggplot(aes(x=task, y=point_est.nps,fill=task_named,ymin=lowerci.nps, ymax=upperci.nps)) + 
  geom_bar(position=position_dodge(), stat="identity") +
  coord_cartesian(ylim=c(-100,100)) +
  geom_errorbar(position=position_dodge(), stat="identity",color="gray",width=.2) +
  #geom_abline(intercept=.5,slope=0, color = "gray",linetype = 2, size=2) +
  geom_text(aes(label = round(point_est.nps,0),hjust=2,vjust=vjust_value,y=0), size = 5, position = "identity") +
  labs(x="", y="SUM scores") +
  ggtitle(label = "SUM scores for each measure on all tasks",
          subtitle = "Confidence Intervals at 90%") +
  scale_fill_manual(values=colpal)+
  guides(fill=guide_legend(title="Task Legend"))+
  ggthemes::theme_tufte(base_family="GillSans") + 
  theme(
    axis.text.x = element_text(size = 15)
    ) -> p.all_tasks_nps

ggsave(
  "plot_all_task_nps.png",
  plot = p.all_tasks_nps,
  device = "png",
  bg =  "transparent",
  width = 10,
  height = 5)


#end SUM


