const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#030510", /* black   */
  [1] = "#65124C", /* red     */
  [2] = "#3D4E69", /* green   */
  [3] = "#B34452", /* yellow  */
  [4] = "#0655A2", /* blue    */
  [5] = "#0959A7", /* magenta */
  [6] = "#DF6C8B", /* cyan    */
  [7] = "#82cce1", /* white   */

  /* 8 bright colors */
  [8]  = "#5b8e9d",  /* black   */
  [9]  = "#65124C",  /* red     */
  [10] = "#3D4E69", /* green   */
  [11] = "#B34452", /* yellow  */
  [12] = "#0655A2", /* blue    */
  [13] = "#0959A7", /* magenta */
  [14] = "#DF6C8B", /* cyan    */
  [15] = "#82cce1", /* white   */

  /* special colors */
  [256] = "#030510", /* background */
  [257] = "#82cce1", /* foreground */
  [258] = "#82cce1",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
