<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal" id="myModal">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">받는이 :</h5>
										<h4 id="receiverr"></h4>
										<input type="hidden" name="receiver"  id="receiver" />
										<input type="hidden" name="receiverid"id="receiverid"  /> 
										<input type="hidden"name="sender" id="sender" /> 
										<input type="hidden" name="senderid" id="senderid" />
										<input type="hidden" name="chk" value="1" id="chk" />
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
									<textarea rows="8" cols="20" class="form-control" name="content" id="content"></textarea>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-success msgbtn btn-sm" onclick="mag_gogogo()">전송</button>
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
									</div>
							</div>
						</div>
					</div>