document.addEventListener("DOMContentLoaded", () => {
    // Lấy phần đầu tiên của đường dẫn (sau dấu / đầu tiên)
    const currentPath = window.location.pathname.split('/')[1];
    
    // Chọn tất cả các liên kết trong navbar
    const navLinks = document.querySelectorAll(".nav-bar a");

    navLinks.forEach(link => {
        // Lấy phần đầu tiên của href trong từng liên kết
        const linkPath = link.getAttribute("href").split('/')[1];

        // So sánh và thêm lớp 'active' nếu trùng
        if (linkPath === currentPath) {
            link.classList.add("active");
        }
    });
});
