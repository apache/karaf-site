/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"

global_settings {
  max_trace_level 5
  ambient_light 1.5
}

camera {
   location <-4, 2, -8>*1
   direction <0, 0,  2.25>
   right x*1.33
   look_at <1,1.5,0>
}

               
light_source { <-1,12,-5> color White }
light_source { <1,1.5,-10> color White }
               
sky_sphere {
    pigment {
        color White
    }
}

intersection {
  plane { 
    y,0
  }               
  box { 
    <-5,0,-5>, <5,0,5> 
    scale 2
  } 
  
  texture { 
    pigment { rgb <1,1,1> }
    finish { 
        ambient 0.25
        diffuse 0.25
        reflection 0.5
    }    
  } 
  
  //texture { Glass   }
}
             
#declare main_text =
union {
  text {
    ttf "Impact.ttf" "Apache" 0.1, 0  
  }
  text {
    ttf "Impact.ttf" "Karaf" 0.1, 0
    translate <0.0, -1.0, 0.0>
  }
  text {
    ttf "Impact.ttf" "v" 0.1, 0    
    scale 0.5
    translate <5.0, -1.0, 0.0>
  }
  text {
    ttf "Impact.ttf" "2.x" 0.1, 0    
    scale 0.8
    translate <5.5, -1.0, 0.0>
  }
  text {
    ttf "Impact.ttf" "OSGi container" 0.1, 0    
    scale 0.5
    translate <1.7, -1.8, 0.0>
  }
  pigment { Black }   
  scale 0.2
  translate <0.5, 1.5, -0.0001>
}     

#declare left_text =
union {
  text {
    ttf "Impact.ttf" "Apache Karaf" 0.1, 0  
  }
  text {
    ttf "Impact.ttf" "v" 0.1, 0    
    scale 0.5
    translate 8.5*x
  }
  text {
    ttf "Impact.ttf" "2.x" 0.1, 0    
    scale 0.8
    translate 9*x
  }
  pigment { Black }   
  scale 0.15
  rotate <0, 90, 0>
  rotate <-90, 0, 0>
  translate <-0.0001, 2.2, 0.6>
}
             
union {
  box { 
    <0.00, 0.10, 0.00>,
    <2.00, 0.20, 1.0>   
    texture { pigment { White } }
  }      
  box { 
    <0.00, 0.20, 0.00>,
    <2.00, 0.40, 1.0>   
    texture {  
      pigment { 
        gradient -y 
        color_map {
          [0.0  color rgb<0.2,0.4,0.58>]
          [1.0  color rgb<0.58,0.72,0.88>]
        }  
        scale 0.5
        translate 0.4*y
      } 
    }
  }      
  box { 
    <0.0, 0.40, 0.0>,
    <2.0, 2.40, 1.0>  
    texture { pigment { White } } 
  }   
  box { 
    <0.00, 2.40, 0.00>,
    <2.00, 2.90, 1.0>   
    texture {  
      pigment { 
        gradient -y 
        color_map {
          [0.0  color rgb<0.2,0.4,0.58>]
          [1.0  color rgb<0.58,0.72,0.88>]
        }  
        scale 0.5
        translate 2.4*y
      } 
    }
    texture {
      pigment {
        image_map { 
          png "asf-logo.png" once 
        }          
      }        
      scale 57/229*y
      scale 0.7
      translate 2.55*y + 1.1*x
    }
    texture {
      pigment {
        image_map { 
          png "karaf.png" once 
        }          
      }        
      scale 57/229*y
      scale 0.8
      translate 2.55*y + 0.1*x
    }
  }      
  box { 
    <0.00, 2.90, 0.00>,
    <2.00, 3.00, 1.0>   
    texture { pigment { White } }
  }      
  object { main_text }
  object { left_text }
}     


         