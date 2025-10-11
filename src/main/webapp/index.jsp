<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LifeFlow - Blood Bank Application</title>
    <link rel="icon" type="image/x-icon"
          href="https://as2.ftcdn.net/v2/jpg/02/59/94/11/1000_F_259941157_WVd0cqQtQXrUiGcQeegO6cex4tT3HMdd.jpg">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#DC2626',
                        secondary: '#991B1B',
                        accent: '#FCA5A5',
                        light: '#FEF2F2',
                    }
                }
            }
        }
    </script>
</head>
<body class="font-sans antialiased">
<%--Navigation--%>
<%@ include file="/components/nav.jsp" %>

<%--Hero Section--%>
<section class="bg-gradient-to-br from-light to-white py-10 lg:py-20">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid lg:grid-cols-2 gap-12 items-center">
            <div>
                <div class="inline-block bg-accent/30 text-primary px-4 py-2 rounded-full text-sm font-semibold mb-6">
                    Saving Lives Together
                </div>
                <h1 class="text-5xl lg:text-6xl font-bold text-gray-900 mb-6 leading-tight text-balance">
                    Every Drop Counts. Every Donor Matters.
                </h1>
                <p class="text-xl text-gray-600 mb-8 leading-relaxed text-pretty">
                    LifeFlow connects generous blood donors with patients in critical need. Join our community and
                    become a hero by donating blood or finding the life-saving match you need.
                </p>
                <div class="flex flex-col sm:flex-row gap-4">
                    <button class="bg-primary text-white px-8 py-4 rounded-full text-lg font-semibold hover:bg-secondary transition shadow-lg hover:shadow-xl">
                        Donate Blood
                    </button>
                    <button class="bg-white text-primary border-2 border-primary px-8 py-4 rounded-full text-lg font-semibold hover:bg-light transition">
                        Request Blood
                    </button>
                </div>
                <div class="mt-12 grid grid-cols-3 gap-6">
                    <div>
                        <div class="text-3xl font-bold text-primary">50K+</div>
                        <div class="text-sm text-gray-600">Active Donors</div>
                    </div>
                    <div>
                        <div class="text-3xl font-bold text-primary">15K+</div>
                        <div class="text-sm text-gray-600">Lives Saved</div>
                    </div>
                    <div>
                        <div class="text-3xl font-bold text-primary">200+</div>
                        <div class="text-sm text-gray-600">Hospitals</div>
                    </div>
                </div>
            </div>
            <div class="relative">
                <img src="https://static.vecteezy.com/system/resources/previews/008/190/897/non_2x/human-blood-donate-on-white-background-free-vector.jpg"
                     alt="Blood Donation" class="rounded-2xl shadow-2xl w-full h-auto">
                <div class="absolute -bottom-6 -left-6 bg-white p-6 rounded-xl shadow-xl hidden lg:block">
                    <div class="flex items-center gap-4">
                        <div class="w-12 h-12 bg-primary/10 rounded-full flex items-center justify-center">
                            <svg class="w-6 h-6 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M5 13l4 4L19 7"></path>
                            </svg>
                        </div>
                        <div>
                            <div class="font-bold text-gray-900">Safe & Secure</div>
                            <div class="text-sm text-gray-600">100% Verified Process</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%--About Section--%>
<section id="about" class="py-20 bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
            <h2 class="text-4xl lg:text-5xl font-bold text-gray-900 mb-4 text-balance">About LifeFlow</h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto text-pretty">
                We're bridging the gap between those who can give and those who need. Our platform makes blood donation
                simple, efficient, and impactful.
            </p>
        </div>
        <div class="grid md:grid-cols-3 gap-8">
            <div class="bg-light p-8 rounded-2xl">
                <div class="w-16 h-16 bg-primary/10 rounded-full flex items-center justify-center mb-6">
                    <svg class="w-8 h-8 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                    </svg>
                </div>
                <h3 class="text-2xl font-bold text-gray-900 mb-4">Find Donors Fast</h3>
                <p class="text-gray-600 leading-relaxed">
                    Search our extensive database of verified donors by blood type, location, and availability. Get
                    matched in minutes, not hours.
                </p>
            </div>
            <div class="bg-light p-8 rounded-2xl">
                <div class="w-16 h-16 bg-primary/10 rounded-full flex items-center justify-center mb-6">
                    <svg class="w-8 h-8 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path>
                    </svg>
                </div>
                <h3 class="text-2xl font-bold text-gray-900 mb-4">Verified & Safe</h3>
                <p class="text-gray-600 leading-relaxed">
                    All donors are thoroughly screened and verified. We partner with certified medical facilities to
                    ensure safety and quality.
                </p>
            </div>
            <div class="bg-light p-8 rounded-2xl">
                <div class="w-16 h-16 bg-primary/10 rounded-full flex items-center justify-center mb-6">
                    <svg class="w-8 h-8 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                </div>
                <h3 class="text-2xl font-bold text-gray-900 mb-4">24/7 Availability</h3>
                <p class="text-gray-600 leading-relaxed">
                    Emergencies don't wait. Our platform operates round the clock to connect you with donors whenever
                    you need them most.
                </p>
            </div>
        </div>
    </div>
</section>

<%--Image Gallery Section--%>
<section class="py-20 bg-gray-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
            <h2 class="text-4xl lg:text-5xl font-bold text-gray-900 mb-4 text-balance">Making a Difference</h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto text-pretty">
                See the impact of our community in action
            </p>
        </div>
        <div class="grid md:grid-cols-2 gap-8">
            <div class="relative group overflow-hidden rounded-2xl shadow-lg">
                <img src="https://ssbhealthcare.com/wp-content/uploads/2023/06/close-up-patient-with-tubes-her-arm-squeezing-ball-her-hand-while-donating-blood_1200x800.jpg"
                     alt="Blood Donation Process" class="w-full h-96 object-cover transition group-hover:scale-105">
                <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent flex items-end p-8">
                    <div class="text-white">
                        <h3 class="text-2xl font-bold mb-2">Donors Making Impact</h3>
                        <p class="text-white/90">Thousands of generous donors giving the gift of life</p>
                    </div>
                </div>
            </div>
            <div class="relative group overflow-hidden rounded-2xl shadow-lg">
                <img src="https://410medical.com/app/uploads/2023/09/KM4A9573221206-Light-Edit-MC.jpg"
                     alt="Patient Receiving Blood" class="w-full h-96 object-cover transition group-hover:scale-105">
                <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent flex items-end p-8">
                    <div class="text-white">
                        <h3 class="text-2xl font-bold mb-2">Lives Being Saved</h3>
                        <p class="text-white/90">Patients receiving life-saving transfusions every day</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%--How It Works--%>
<section id="how-it-works" class="py-20 bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
            <h2 class="text-4xl lg:text-5xl font-bold text-gray-900 mb-4 text-balance">How It Works</h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto text-pretty">
                Simple steps to save lives or get the help you need
            </p>
        </div>
        <div class="grid md:grid-cols-2 gap-16">
            <%--            For Donors--%>
            <div>
                <h3 class="text-2xl font-bold text-primary mb-8">For Donors</h3>
                <div class="space-y-6">
                    <div class="flex gap-4">
                        <div class="flex-shrink-0 w-12 h-12 bg-primary text-white rounded-full flex items-center justify-center font-bold text-xl">
                            1
                        </div>
                        <div>
                            <h4 class="text-xl font-bold text-gray-900 mb-2">Register</h4>
                            <p class="text-gray-600">Create your profile with basic information and blood type</p>
                        </div>
                    </div>
                    <div class="flex gap-4">
                        <div class="flex-shrink-0 w-12 h-12 bg-primary text-white rounded-full flex items-center justify-center font-bold text-xl">
                            2
                        </div>
                        <div>
                            <h4 class="text-xl font-bold text-gray-900 mb-2">Get Verified</h4>
                            <p class="text-gray-600">Complete a simple health screening at our partner facilities</p>
                        </div>
                    </div>
                    <div class="flex gap-4">
                        <div class="flex-shrink-0 w-12 h-12 bg-primary text-white rounded-full flex items-center justify-center font-bold text-xl">
                            3
                        </div>
                        <div>
                            <h4 class="text-xl font-bold text-gray-900 mb-2">Donate</h4>
                            <p class="text-gray-600">Receive notifications when your blood type is needed nearby</p>
                        </div>
                    </div>
                    <div class="flex gap-4">
                        <div class="flex-shrink-0 w-12 h-12 bg-primary text-white rounded-full flex items-center justify-center font-bold text-xl">
                            4
                        </div>
                        <div>
                            <h4 class="text-xl font-bold text-gray-900 mb-2">Save Lives</h4>
                            <p class="text-gray-600">Track your impact and see how many lives you've helped save</p>
                        </div>
                    </div>
                </div>
            </div>
            <%--            For Recipients--%>
            <div>
                <h3 class="text-2xl font-bold text-primary mb-8">For Recipients</h3>
                <div class="space-y-6">
                    <div class="flex gap-4">
                        <div class="flex-shrink-0 w-12 h-12 bg-primary text-white rounded-full flex items-center justify-center font-bold text-xl">
                            1
                        </div>
                        <div>
                            <h4 class="text-xl font-bold text-gray-900 mb-2">Request Blood</h4>
                            <p class="text-gray-600">Submit your requirement with blood type and urgency level</p>
                        </div>
                    </div>
                    <div class="flex gap-4">
                        <div class="flex-shrink-0 w-12 h-12 bg-primary text-white rounded-full flex items-center justify-center font-bold text-xl">
                            2
                        </div>
                        <div>
                            <h4 class="text-xl font-bold text-gray-900 mb-2">Get Matched</h4>
                            <p class="text-gray-600">Our system finds compatible donors in your area instantly</p>
                        </div>
                    </div>
                    <div class="flex gap-4">
                        <div class="flex-shrink-0 w-12 h-12 bg-primary text-white rounded-full flex items-center justify-center font-bold text-xl">
                            3
                        </div>
                        <div>
                            <h4 class="text-xl font-bold text-gray-900 mb-2">Connect</h4>
                            <p class="text-gray-600">Coordinate with donors and schedule the donation</p>
                        </div>
                    </div>
                    <div class="flex gap-4">
                        <div class="flex-shrink-0 w-12 h-12 bg-primary text-white rounded-full flex items-center justify-center font-bold text-xl">
                            4
                        </div>
                        <div>
                            <h4 class="text-xl font-bold text-gray-900 mb-2">Receive Care</h4>
                            <p class="text-gray-600">Get the blood you need at certified medical facilities</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%--Impact Section--%>
<section id="impact" class="py-20 bg-primary text-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
            <h2 class="text-4xl lg:text-5xl font-bold mb-4 text-balance">Our Impact</h2>
            <p class="text-xl text-white/90 max-w-3xl mx-auto text-pretty">
                Together, we're creating a healthier, more compassionate world
            </p>
        </div>
        <div class="grid md:grid-cols-4 gap-8 text-center">
            <div>
                <div class="text-5xl font-bold mb-2">50,000+</div>
                <div class="text-white/80 text-lg">Registered Donors</div>
            </div>
            <div>
                <div class="text-5xl font-bold mb-2">15,000+</div>
                <div class="text-white/80 text-lg">Lives Saved</div>
            </div>
            <div>
                <div class="text-5xl font-bold mb-2">200+</div>
                <div class="text-white/80 text-lg">Partner Hospitals</div>
            </div>
            <div>
                <div class="text-5xl font-bold mb-2">98%</div>
                <div class="text-white/80 text-lg">Success Rate</div>
            </div>
        </div>
    </div>
</section>

<%--Testimonials--%>
<section class="py-20 bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
            <h2 class="text-4xl lg:text-5xl font-bold text-gray-900 mb-4 text-balance">Stories of Hope</h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto text-pretty">
                Hear from those whose lives have been touched by our community
            </p>
        </div>
        <div class="grid md:grid-cols-3 gap-8">
            <div class="bg-light p-8 rounded-2xl">
                <div class="flex items-center gap-4 mb-6">
                    <div class="w-16 h-16 bg-primary/20 rounded-full">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/4/4f/Michael_Pirson.jpg"
                             class="object-cover w-full h-full rounded-full" alt="Michael ">
                    </div>
                    <div>
                        <div class="font-bold text-gray-900">Sarah Johnson</div>
                        <div class="text-sm text-gray-600">Regular Donor</div>
                    </div>
                </div>
                <p class="text-gray-700 leading-relaxed italic">
                    "Donating blood through LifeFlow has been incredibly rewarding. Knowing I've helped save lives makes
                    me feel like a real hero."
                </p>
            </div>
            <div class="bg-light p-8 rounded-2xl">
                <div class="flex items-center gap-4 mb-6">
                    <div class="w-16 h-16 bg-primary/20 rounded-full">
                        <img src="https://static.honestdocs.id/989x500/webp/system/blog_articles/main_hero_images/000/005/310/original/iStock-913714110_%281%29.jpg"
                             class="object-cover w-full h-full rounded-full" alt="Michael Chen ">
                    </div>
                    <div>
                        <div class="font-bold text-gray-900">Michael Chen</div>
                        <div class="text-sm text-gray-600">Recipient's Family</div>
                    </div>
                </div>
                <p class="text-gray-700 leading-relaxed italic">
                    "When my father needed emergency surgery, LifeFlow connected us with donors within hours. They
                    literally saved his life."
                </p>
            </div>
            <div class="bg-light p-8 rounded-2xl">
                <div class="flex items-center gap-4 mb-6">
                    <div class="w-16 h-16 bg-primary/20 rounded-full">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/4/4f/Michael_Pirson.jpg"
                             class="object-cover w-full h-full rounded-full" alt="Michael ">
                    </div>
                    <div>
                        <div class="font-bold text-gray-900">Dr. Emily Rodriguez</div>
                        <div class="text-sm text-gray-600">Hospital Partner</div>
                    </div>
                </div>
                <p class="text-gray-700 leading-relaxed italic">
                    "LifeFlow has revolutionized how we manage blood supply. The platform is efficient, reliable, and
                    has saved countless lives."
                </p>
            </div>
        </div>
    </div>
</section>

<%--CTA Section--%>
<section class="py-20 bg-gradient-to-br from-primary to-secondary text-white">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <h2 class="text-4xl lg:text-5xl font-bold mb-6 text-balance">Ready to Make a Difference?</h2>
        <p class="text-xl mb-10 text-white/90 text-pretty">
            Join thousands of heroes who are saving lives every day. Your contribution matters.
        </p>
        <div class="flex flex-col sm:flex-row gap-4 justify-center">
            <button class="bg-white text-primary px-8 py-4 rounded-full text-lg font-semibold hover:bg-gray-100 transition shadow-lg">
                Become a Donor
            </button>
            <button class="bg-transparent border-2 border-white text-white px-8 py-4 rounded-full text-lg font-semibold hover:bg-white/10 transition">
                Learn More
            </button>
        </div>
    </div>
</section>

<%--Footer--%>
<footer id="contact" class="bg-gray-900 text-white py-16">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid md:grid-cols-4 gap-8 mb-12">
            <div>
                <div class="flex items-center gap-2 mb-4">
                    <svg class="w-8 h-8 text-primary" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
                    </svg>
                    <span class="text-2xl font-bold">LifeFlow</span>
                </div>
                <p class="text-gray-400">Connecting donors with those in need, one drop at a time.</p>
            </div>
            <div>
                <h4 class="font-bold mb-4">Quick Links</h4>
                <ul class="space-y-2 text-gray-400">
                    <li><a href="#" class="hover:text-white transition">About Us</a></li>
                    <li><a href="#" class="hover:text-white transition">How It Works</a></li>
                    <li><a href="#" class="hover:text-white transition">Find Donors</a></li>
                    <li><a href="#" class="hover:text-white transition">Donate Blood</a></li>
                </ul>
            </div>
            <div>
                <h4 class="font-bold mb-4">Support</h4>
                <ul class="space-y-2 text-gray-400">
                    <li><a href="#" class="hover:text-white transition">FAQ</a></li>
                    <li><a href="#" class="hover:text-white transition">Contact Us</a></li>
                    <li><a href="#" class="hover:text-white transition">Privacy Policy</a></li>
                    <li><a href="#" class="hover:text-white transition">Terms of Service</a></li>
                </ul>
            </div>
            <div>
                <h4 class="font-bold mb-4">Contact</h4>
                <ul class="space-y-2 text-gray-400">
                    <li>Email: info@lifeflow.com</li>
                    <li>Phone: 1-800-DONATE</li>
                    <li>Emergency: 911</li>
                </ul>
            </div>
        </div>
        <div class="border-t border-gray-800 pt-8 text-center text-gray-400">
            <p>&copy; 2025 LifeFlow. All rights reserved. Saving lives together.</p>
        </div>
    </div>
</footer>
</body>
</html>