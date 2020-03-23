<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jsp"%>

<body>

	<div class="container">
		<div class="sub-container ml-auto mr-auto shadow">
			<hr>
			<h1 class="font-weight-bold text-info p-3 text-center project-title" data-toggle="modal" data-target="#copyright">Bucket List</h1>
			<hr>

			<div class="content m-3">

				<div class="list">

					<c:choose>

						<c:when test="${fn:length(LIST) == 0}">
							<div class="row justify-content-center pl-4 pr-4 pt-2 pb-2">자신만의 버킷 리스트를 작성해보세요!</div>
						</c:when>

						<c:otherwise>
							<c:forEach items="${LIST}" var="vo">

								<!-- list -->
								<div class="row justify-content-between pl-4 pr-4 pt-2 pb-2" data-toggle="modal" data-target="#item-${vo.b_id}">

									<div class="
									<c:if test="${vo.b_complete == 1}">
										complete text-success
									</c:if>">${vo.b_subject}</div>
									<div class="text-success">
										<c:if test="${vo.b_complete ==1}">
									✓
								</c:if>
									</div>
								</div>


								<!-- read modal -->
								<div class="modal fade" id="item-${vo.b_id}">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title font-weight-bold">${vo.b_subject}</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<!-- item info -->
											<div class="modal-body">
												<div>등록일자: ${vo.b_reg_date}</div>
												<c:if test="${vo.b_reg_date ne vo.b_update_date}">
													<div>수정일자: ${vo.b_update_date}</div>
												</c:if>
											</div>

											<!-- item text -->
											<div class="modal-body">${vo.b_text}</div>
											<div class="modal-footer">
												<button class="btn btn-info btn-complete" data-id="${vo.b_id}">
													<c:if test="${vo.b_complete == 0}">
												완료
											</c:if>
													<c:if test="${vo.b_complete == 1}">
												취소
											</c:if>
												</button>
												<button class="btn btn-primary" data-toggle="modal" data-target="#write-${vo.b_id}">수정하기</button>
												<button class="btn btn-danger btn-delete" data-id="${vo.b_id}">삭제하기</button>
												<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div>


								<!-- modify modal -->
								<div class="modal fade" id="write-${vo.b_id}">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title font-weight-bold">버킷리스트 수정하기</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<form action="/update" method="POST">

												<input type="hidden" name="b_id" value="${vo.b_id}">

												<div class="modal-body">

													<div class="form-group">
														<input class="form-control input-subject" placeholder="제목" name="b_subject" value="${vo.b_subject}">
													</div>
													<div class="form-group">
														<textarea class="form-control input-text" placeholder="본문" rows="5" name="b_text">${vo.b_text}</textarea>
													</div>

												</div>
												<div class="modal-footer">
													<button class="btn btn-primary btn-writer">수정하기</button>
													<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</div>

			</div>

			<hr>

			<div class="d-flex justify-content-end">
				<button class="btn btn-primary m-3" data-toggle="modal" data-target="#write"><i class="fas fa-pencil-alt fa-2x"></i></button>
			</div>

		</div>

	</div>

	<div class="modal fade" id="write">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title font-weight-bold">버킷리스트 추가하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="/insert" method="POST">
					<div class="modal-body">

						<div class="form-group">
							<input class="form-control input-subject" placeholder="제목" name="b_subject">
						</div>
						<div class="form-group">
							<textarea class="form-control input-text" placeholder="본문" rows="5" name="b_text"></textarea>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary btn-writer">등록하기</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade" id="copyright">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title font-weight-bold">OneDay-Project BucketList</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<p>2020.3.23</p> 
					<p>Copyright &copy; 2020 by Jewon513@gmail.com<p>
					<a href="https://github.com/jewon513"><i class="fab fa-github-square fa-4x"></i></a>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

</body>

</html>