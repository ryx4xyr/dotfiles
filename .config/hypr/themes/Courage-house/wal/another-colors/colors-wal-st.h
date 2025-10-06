const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#100a21", /* black   */
  [1] = "#4E53B7", /* red     */
  [2] = "#6559B9", /* green   */
  [3] = "#7039C9", /* yellow  */
  [4] = "#6765C7", /* blue    */
  [5] = "#9B66D3", /* magenta */
  [6] = "#B960CA", /* cyan    */
  [7] = "#d9c1db", /* white   */

  /* 8 bright colors */
  [8]  = "#978799",  /* black   */
  [9]  = "#4E53B7",  /* red     */
  [10] = "#6559B9", /* green   */
  [11] = "#7039C9", /* yellow  */
  [12] = "#6765C7", /* blue    */
  [13] = "#9B66D3", /* magenta */
  [14] = "#B960CA", /* cyan    */
  [15] = "#d9c1db", /* white   */

  /* special colors */
  [256] = "#100a21", /* background */
  [257] = "#d9c1db", /* foreground */
  [258] = "#d9c1db",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
