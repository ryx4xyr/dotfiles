const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#1f0f10", /* black   */
  [1] = "#6D452A", /* red     */
  [2] = "#9E201D", /* green   */
  [3] = "#E6211F", /* yellow  */
  [4] = "#F50E21", /* blue    */
  [5] = "#A24820", /* magenta */
  [6] = "#E35020", /* cyan    */
  [7] = "#c3aa97", /* white   */

  /* 8 bright colors */
  [8]  = "#887669",  /* black   */
  [9]  = "#6D452A",  /* red     */
  [10] = "#9E201D", /* green   */
  [11] = "#E6211F", /* yellow  */
  [12] = "#F50E21", /* blue    */
  [13] = "#A24820", /* magenta */
  [14] = "#E35020", /* cyan    */
  [15] = "#c3aa97", /* white   */

  /* special colors */
  [256] = "#1f0f10", /* background */
  [257] = "#c3aa97", /* foreground */
  [258] = "#c3aa97",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
