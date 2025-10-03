const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#121812", /* black   */
  [1] = "#4F6E9A", /* red     */
  [2] = "#778EB0", /* green   */
  [3] = "#759CDA", /* yellow  */
  [4] = "#93A2B3", /* blue    */
  [5] = "#97B2D6", /* magenta */
  [6] = "#8DB0E1", /* cyan    */
  [7] = "#d2dade", /* white   */

  /* 8 bright colors */
  [8]  = "#93989b",  /* black   */
  [9]  = "#4F6E9A",  /* red     */
  [10] = "#778EB0", /* green   */
  [11] = "#759CDA", /* yellow  */
  [12] = "#93A2B3", /* blue    */
  [13] = "#97B2D6", /* magenta */
  [14] = "#8DB0E1", /* cyan    */
  [15] = "#d2dade", /* white   */

  /* special colors */
  [256] = "#121812", /* background */
  [257] = "#d2dade", /* foreground */
  [258] = "#d2dade",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
