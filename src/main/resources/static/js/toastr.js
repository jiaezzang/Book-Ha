// escapeHtml 허용여부
toastr.options.escapeHtml = true;
// closeButton을 생성여부
toastr.options.closeButton = true;
// closeButton의 커스텀
toastr.options.closeHtml = '';
// 메시지 창이 사라질 때의 애니메이션 효과
toastr.options.closeMethod = 'fadeOut';
// 메시지 창의 애니메이션 효과 시간
toastr.options.closeDuration = 300;
toastr.options.closeEasing = 'swing';
// 새로운 창의 위치, true이면 가장 위 포지션, false면 가장 아래 포지션
toastr.options.newestOnTop = false;
// 이벤트 옵션// 추가될 때 이벤트
//toastr.options.onShown = function() { console.log('hello'); }
// 사라질 때 이벤트
//toastr.options.onHidden = function() { console.log('goodbye'); }
// 클릭될 때 이벤트
//toastr.options.onclick = function() { console.log('clicked'); }
// 닫기 버튼이 눌릴 때 이벤트
//toastr.options.onCloseClick = function() { console.log('close button clicked'); }
// 메시지 중복 허용 여부, 두개 이상 메시지가 생성될 때 이 전꺼는 사라짐
toastr.options.preventDuplicates = false;
// 메시지가 표시되는 시간
toastr.options.timeOut = 2000;
// 메시지 위로 커서를 올렸을 때 표시되는 시간
toastr.options.extendedTimeOut = 60;
// 만약 메시지 표시되는 시간과 올렸을 때 표시되는 시간을 0으로 하면 메시지는 사라지지 않는다.
// 프로그래스바 표시 여부
toastr.options.progressBar = true;
// 글자를 오른쪽 정렬 여부
toastr.options.rtl = false;
//애니메이션 설정 여부
toastr.options.showEasing = 'swing';

toastr.options.hideEasing = 'linear';
toastr.options.closeEasing = 'linear';
toastr.options.showMethod = 'fadeIn';
toastr.options.hideMethod = 'fadeOut';
toastr.options.closeMethod = 'fadeOut';