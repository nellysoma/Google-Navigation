<%@ page import="java.sql.*,java.io.*,java.util.*" %> 

                    <%
                        String id = request.getParameter("destination");//Integer.parseInt(request.getParameter("imgid"));
                        try {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/photo?serverTimezone=UTC", "root", "root");
                            Statement st = con.createStatement();
                            String strQuery = "select photo from location where latlng='" + id + "'";
                            ResultSet rs = st.executeQuery(strQuery);

                            String imgLen = "";
                            if (rs.next()) {
                                imgLen = rs.getString("photo");
                            }
                            rs = st.executeQuery(strQuery);
                            if (rs.next()) {
                                int len = imgLen.length();
                                byte[] rb = new byte[len];
                                InputStream readImg = rs.getBinaryStream(1);
                                int index = readImg.read(rb, 0, len);
                                st.close();
                                response.reset();
                                response.getOutputStream().write(rb, 0, len);
                                response.getOutputStream().flush();                               
                            }
                            
                                //request.setAttribute("id", id);
                                //response.sendRedirect("/image1.jsp");
                                //RequestDispatcher rd = getServletContext().getRequestDispatcher("/image1.jsp");

                                //rd.forward(request, response);
                            
                        } catch (SQLException e) {
                            e.printStackTrace();
                            out.print(e);
                        }
                    %>
                    
                    






