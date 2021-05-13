
package watch;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/downloadReport")
public class DownloadReportServlet extends HttpServlet {
	private final int ARBITARY_SIZE = 1048;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String filename = req.getParameter("filename");

		String tmpdirBase = System.getProperty("java.io.tmpdir");
		File tmpdirBaseFile = new File(tmpdirBase);
		

		File file = new File(tmpdirBaseFile, filename);

		resp.setContentType("application/octet-stream");
		resp.setHeader("Content-disposition", "attachment; filename=" + filename);

		try (InputStream in = new FileInputStream(file); OutputStream out = resp.getOutputStream()) {

			byte[] buffer = new byte[ARBITARY_SIZE];

			int numBytesRead;
			while ((numBytesRead = in.read(buffer)) > 0) {
				out.write(buffer, 0, numBytesRead);
			}
		}
	}
}
