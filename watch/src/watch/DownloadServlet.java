
package watch;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/download")
public class DownloadServlet extends HttpServlet {
	private final int ARBITARY_SIZE = 1048;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String filename = req.getParameter("filename");

		String catalinaBase = System.getProperty("catalina.base");
		File catalinaBaseFile = new File(catalinaBase);
		File logsFile = new File(catalinaBaseFile, "logs");
		File file = new File(logsFile, filename);

		resp.setContentType("text/plain");
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