class Point {
	public int x;
	public int y;

	public Point(int x, int y) {
		this.x = x;
		this.y = y;
	}

	public string to_string() {
		return @"($x,$y)";
	}
}

Point[] bresenham(int x_start, int y_start, int x_end, int y_end) {
	if (x_end < x_start) {
		int x_save = x_start;
		x_start = x_end;
		x_end = x_save;
		int y_save = y_start;
		y_start = y_end;
		y_end = y_save;
	}

	int x_diff = x_end - x_start;
	int y_diff = y_end - y_start;
	int d = 2*y_diff - x_diff;
	int y = y_start;

	int size = (int) Math.fmax(x_diff, Math.fabs(y_diff));
	Point[] res = new Point[size+1];

	if (Math.fabs(y_diff) > Math.fabs(x_diff)) {
		d = 2*x_diff - y_diff;
		int x = x_start;
		if (y_diff < 0) {
			int x_save = x_start;
			x_start = x_end;
			x_end = x_save;
			int y_save = y_start;
			y_start = y_end;
			y_end = y_save;

			x = x_start;
			y = y_start;

			y_diff *= -1;
			d = 2*x_diff - y_diff;
			for (int i = 0; y <= y_end; y++, i++) {
				res[i] = new Point(x, y);

				if (d > 0) {
					x--;
					d -= 2*y_diff;
				}

				d += 2*x_diff;
			}
		} else {
			for (int i = 0; y <= y_end; y++, i++) {
				res[i] = new Point(x, y);

				if (d > 0) {
					x++;
					d -= 2*y_diff;
				}

				d += 2*x_diff;
			}
		}
	} else {
		if (y_diff < 0) {
			y_diff *= -1;
			d = 2*y_diff - x_diff;
			for (int x = x_start, i = 0; x <= x_end; x++, i++) {
				res[i] = new Point(x, y);
		
				if (d > 0) {
					y--;
					d -= 2*x_diff;
				}
		
				d += 2*y_diff;
			}
		} else {
			for (int x = x_start, i = 0; x <= x_end; x++, i++) {
				res[i] = new Point(x, y);
	
				if (d > 0) {
					y++;
					d -= 2*x_diff;
				}
	
				d += 2*y_diff;
			}
		}
	}

	return res;
}
