import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'worker_register_screen.dart';
import 'contractor_register_screen.dart';
import 'company_register_screen.dart';
import '../constants/roles.dart';

class LoginScreen extends StatefulWidget {
  final String role;
  const LoginScreen({super.key, required this.role});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool otpSent = false;
  int secondsLeft = 60;
  Timer? timer;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  void startTimer() {
    timer?.cancel();
    setState(() => secondsLeft = 60);
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsLeft == 0) {
        t.cancel();
      } else {
        setState(() => secondsLeft--);
      }
    });
  }

  void sendOtp() {
    if (phoneController.text.length == 10) {
      setState(() => otpSent = true);
      startTimer();
    }
  }

  void verifyOtp() {
    if (otpController.text.length == 6) {
      if (widget.role == Roles.labour) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const WorkerRegisterScreen(),
          ),
        );
      } else if (widget.role == 'contractor') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const ContractorRegisterScreen(),
          ),
        );
      } else if (widget.role == 'company') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const CompanyRegisterScreen(),
          ),
        );
      } else {
        Navigator.pop(context);
      }
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image (no Transform.scale — full cover)
          Positioned.fill(
            child: Image.asset(
              'assets/images/labour.png',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          // Light blur layer on top of image
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          // Solid bluish overlay (opacity ~0.7)
          Positioned.fill(
            child: Container(
              color: const Color(0xFF16263F).withOpacity(0.45),
            ),
          ),

          // Center modal
          Center(
            child: Container(
              width: 360,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF16263F),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 25,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Login to WorkForce",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white70),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Secure access using OTP verification",
                    style: TextStyle(color: Colors.white60, fontSize: 13),
                  ),

                  const SizedBox(height: 24),

                  if (!otpSent) ...[
                    const Text(
                      "Mobile Number",
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: "Enter 10-digit mobile number",
                        hintStyle:
                            const TextStyle(color: Colors.white38),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.08),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFFFF8C32),
                        ),
                        onPressed: sendOtp,
                        child: const Text(
                          "Send OTP",
                          style: TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],

                  if (otpSent) ...[
                    const Text(
                      "Enter OTP",
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        letterSpacing: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: "• • • • • •",
                        hintStyle:
                            const TextStyle(color: Colors.white38),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.08),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: secondsLeft > 0
                          ? Text(
                              "Resend OTP in 00:${secondsLeft.toString().padLeft(2, '0')}",
                              style: const TextStyle(
                                  color: Colors.white60),
                            )
                          : TextButton(
                              onPressed: startTimer,
                              child: const Text(
                                "Resend OTP",
                                style: TextStyle(
                                    color: Color(0xFFFF8C32)),
                              ),
                            ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFFFF8C32),
                        ),
                        onPressed: verifyOtp,
                        child: const Text(
                          "Verify & Continue",
                          style: TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Cancel",
                          style:
                              TextStyle(color: Colors.white54),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
