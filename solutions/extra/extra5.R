# Ex.5 extra

#using a comparison operator and [], select the rows which correspond to a “placebo” treatment (in the “trt” column).

bacteria[ bacteria$trt == "placebo" , ]

# fraction of "y" in column y

mean(bacteria$y=="y")
mean(bacteria$y=="y" & bacteria$trt=="placebo")
mean(bacteria$y=="y" & bacteria$trt=="drug")
mean(bacteria$y=="y" & bacteria$trt=="drug+")
