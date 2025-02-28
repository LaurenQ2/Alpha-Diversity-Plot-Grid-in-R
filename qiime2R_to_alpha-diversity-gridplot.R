# QIIME2R install
install.packages("devtools")
devtools::install_github("jbisanz/qiime2R")

library(qiime2R)
library(tidyverse)
library(ggforce)

metadata_16S <- read_q2metadata("metadata_16S.tsv")
shannon-16S <- read_qza("shannon_vector_16S.qza")$data %>% rownames_to_column("SampleID")
faithpd_16S <- read_qza("faith_pd_vector_16S.qza")$data %>% rownames_to_column("SampleID")
asv_richness_16S <- read_csv("ASV_richness_16S.csv")
evenness_16S <- read_qza("evenness_vector_16S.qza")$data %>% rownames_to_column("SampleID")

faithpd_16S <- faithpd_16S %>% 
  select(SampleID = V1, FaithPD = V2) %>% 
  left_join(metadata_16S) %>% 
  mutate(scion = factor(x = scion, 
                        levels = c("828", "calera", "777", "mt-eden"),
                        labels = c("828", "Calera", "777", "Mt Eden"),
                        ordered = TRUE))

faithpd_16S_dotPlot <- ggplot(faithpd_16S, aes(x = scion, y = FaithPD, fill = rootstock)) +
  xlab("") + ylab("Faith's PD") +
  geom_dotplot(binaxis = 'y',
               dotsize = 3,
               stackdir = 'center')

faithpd_16S_dotPlot

shannon_16S <- shannon_16S %>% 
  left_join(shannon_16S) %>% 
  left_join(metadata_16S) %>% 
  mutate(scion = factor(x = scion, 
              levels = c("828", "calera", "777", "mt-eden"),
              labels = c("828", "Calera", "777", "Mt Eden"),
              ordered = TRUE))

shannon_16S_dotPlot <- ggplot(shannon_16S, aes(x = scion, y = shannon_entropy, fill = rootstock)) +
  xlab("") + ylab("Shannon") +
  geom_dotplot(binaxis = 'y',
               dotsize = 3,
               stackdir = 'center')

shannon_16S_dotPlot

asv_richness_16S <- asv_richness_16S %>% 
  left_join(asv_richness_16S) %>% 
  left_join(metadata_16S) %>% 
  mutate(scion = factor(x = scion, 
                        levels = c("828", "calera", "777", "mt-eden"),
                        labels = c("828", "Calera", "777", "Mt Eden"),
                        ordered = TRUE))

asv_richness_16S_dotPlot<- ggplot(asv_richness_16S, aes(x = scion, y = ASV_Richness, fill = rootstock)) +
  xlab("") + ylab("ASV Richness") +
  geom_dotplot(binaxis = 'y',
               dotsize = 3,
               stackdir = 'center')

asv_richness_16S_dotPlot

evenness_16S <- evenness_16S %>% 
  left_join(evenness_16S) %>% 
  left_join(metadata_16S) %>% 
  mutate(scion = factor(x = scion, 
                        levels = c("828", "calera", "777", "mt-eden"),
                        labels = c("828", "Calera", "777", "Mt Eden"),
                        ordered = TRUE))

evenness_16S_dotPlot <- ggplot(evenness_16S, aes(x = scion, y = pielou_evenness, fill = rootstock)) +
  xlab("") + ylab("Pielou Evenness") +
  geom_dotplot(binaxis = 'y',
               dotsize = 3,
               stackdir = 'center')

evenness_16S_dotPlot


metadata_ITS <- read_q2metadata("metadata_2023_ITS.tsv")
shannon_ITS <- read_qza("2023_ITS_shannon_vector.qza")$data %>% rownames_to_column("SampleID")
faithpd_ITS <- read_qza("2023_ITS_faith_pd_vector.qza")$data %>% rownames_to_column("SampleID")
asv_richness_ITS <- read_csv("2023_ITS_ASV_richness.csv")
evenness_ITS <- read_qza("2023_ITS_evenness_vector.qza")$data %>% rownames_to_column("SampleID")


faithpd_ITS <- faithpd_ITS %>% 
  select(SampleID = V1, FaithPD = V2) %>% 
  left_join(metadata_ITS) %>% 
  mutate(scion = factor(x = scion, 
                        levels = c("828", "calera", "777", "mt-eden"),
                        labels = c("828", "Calera", "777", "Mt Eden"),
                        ordered = TRUE))

faithpd_ITS_dotPlot <- ggplot(faithpd_ITS, aes(x = scion, y = FaithPD, fill = rootstock)) +
  xlab("") + ylab("Faith's PD") +
  geom_dotplot(binaxis = 'y',
               dotsize = 3,
               stackdir = 'center')

faithpd_ITS_dotPlot

shannon_ITS <- shannon_ITS %>% 
  left_join(shannon_ITS) %>% 
  left_join(metadata_ITS) %>% 
  mutate(scion = factor(x = scion, 
                        levels = c("828", "calera", "777", "mt-eden"),
                        labels = c("828", "Calera", "777", "Mt Eden"),
                        ordered = TRUE))

shannon_ITS_dotPlot <- ggplot(shannon_ITS, aes(x = scion, y = shannon_entropy, fill = rootstock)) +
  xlab("") + ylab("Shannon") +
  geom_dotplot(binaxis = 'y',
               dotsize = 3,
               stackdir = 'center')

shannon_ITS_dotPlot

asv_richness_ITS <- asv_richness_ITS %>% 
  left_join(asv_richness_ITS) %>% 
  left_join(metadata_ITS) %>% 
  mutate(scion = factor(x = scion, 
                        levels = c("828", "calera", "777", "mt-eden"),
                        labels = c("828", "Calera", "777", "Mt Eden"),
                        ordered = TRUE))

asv_richness_ITS_dotPlot <- ggplot(asv_richness_ITS, aes(x = scion, y = ASV_Richness, fill = rootstock)) +
  xlab("") + ylab("ASV Richness") +
  geom_dotplot(binaxis = 'y',
               dotsize = 3,
               stackdir = 'center')

asv_richness_ITS_dotPlot


evenness_ITS <- evenness_ITS %>% 
  left_join(evenness_ITS) %>% 
  left_join(metadata_ITS) %>% 
  mutate(scion = factor(x = scion, 
                        levels = c("828", "calera", "777", "mt-eden"),
                        labels = c("828", "Calera", "777", "Mt Eden"),
                        ordered = TRUE))

evenness_ITS_dotPlot <- ggplot(evenness_ITS, aes(x = scion, y = pielou_evenness, fill = rootstock)) +
  xlab("") + ylab("Pielou Evenness") +
  geom_dotplot(binaxis = 'y',
               dotsize = 3,
               stackdir = 'center')

evenness_ITS_dotPlot


#making a plot grid with ggpubr and ggarrange

library(ggplot2)
install.packages(ggpubr)
install.packages("devtools") 
library(ggpubr)

plot1<- asv_richness_16S_dotPlot
plot2<- asv_richness_ITS_dotPlot
plot3<- evenness_16S_dotPlot
plot4<- evenness_ITS_dotPlot
plot5<- shannon_16S_dotPlot
plot6<- shannon_ITS_dotPlot
plot7<- faithpd_16S_dotPlot
plot8<- faithpd_ITS_dotPlot

plotlist<- list(plot1, plot2, plot3, plot4, plot5, plot6, plot7, plot8)

plotlist<- ggarrange(plotlist = plotlist, ncol = 2, nrow = 4, widths = c(0.25, 0.25), common.legend = TRUE, legend="bottom") 

annotate_figure(plotlist, 
                top = text_grob("16S, Bacteria & Archaea                  ITS, Fungi & Other Eukaryotes", color = "black", face = "bold", size = 12))

plotlist
