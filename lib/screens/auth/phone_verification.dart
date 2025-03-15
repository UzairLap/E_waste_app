import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../home.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PhoneVerificationScreen extends StatefulWidget {
  @override
  _PhoneVerificationScreenState createState() => _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  bool _isLoading = false;
  bool _otpSent = false;
  int _timeLeft = 60;
  bool _resendActive = false;

  // Main app theme colors - matches other screens
  final Color primaryGreen = Color(0xFF4CAF50);
  final Color accentGreen = Color(0xFF8BC34A);
  final Color backgroundColor = Colors.white;
  final Color textDarkColor = Color(0xFF2E7D32);
  final Color textLightColor = Color(0xFF81C784);

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  void _sendOTP() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call delay
      await Future.delayed(Duration(seconds: 1));

      setState(() {
        _isLoading = false;
        _otpSent = true;
        _startCountdown();
      });
    }
  }

  void _startCountdown() {
    Future.delayed(Duration(seconds: 1), () {
      if (_timeLeft > 0 && mounted) {
        setState(() {
          _timeLeft--;
        });
        _startCountdown();
      } else if (mounted) {
        setState(() {
          _resendActive = true;
        });
      }
    });
  }

  void _verifyOTP() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call delay
      await Future.delayed(Duration(seconds: 1));

      setState(() {
        _isLoading = false;
      });

      // Navigate to Home Page after successful verification
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: textDarkColor),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ).animate().fadeIn(duration: 300.ms),

                  SizedBox(height: 20),

                  // Phone Icon
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: accentGreen.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.phone_android,
                          size: 50,
                          color: primaryGreen,
                        ),
                      ),
                    ),
                  ).animate().fadeIn(duration: 600.ms).scale(delay: 200.ms),

                  SizedBox(height: 40),

                  // Header
                  Text(
                    'Phone Verification',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: textDarkColor,
                    ),
                  ).animate().fadeIn(duration: 500.ms).moveX(begin: -20, end: 0),

                  SizedBox(height: 8),

                  Text(
                    'We\'ll send a verification code to your phone',
                    style: TextStyle(
                      fontSize: 16,
                      color: textLightColor,
                    ),
                  ).animate().fadeIn(duration: 500.ms, delay: 200.ms).moveX(begin: -20, end: 0),

                  SizedBox(height: 40),

                  // Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Phone Number Field
                        _buildPhoneField().animate().fadeIn(duration: 400.ms, delay: 300.ms),

                        SizedBox(height: 20),

                        // Send OTP Button
                        if (!_otpSent)
                          _buildSendOTPButton().animate().fadeIn(duration: 400.ms, delay: 400.ms),

                        // OTP Field and Verify Button
                        if (_otpSent) ...[
                          _buildOTPFields().animate().fadeIn(duration: 400.ms),

                          SizedBox(height: 10),

                          // Resend OTP Timer/Button
                          _buildResendOption().animate().fadeIn(duration: 300.ms),

                          SizedBox(height: 30),

                          // Verify Button
                          _buildVerifyButton().animate().fadeIn(duration: 400.ms),
                        ],
                      ],
                    ),
                  ),

                  // Security Note
                  if (_otpSent)
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: _buildSecurityNote().animate().fadeIn(duration: 400.ms, delay: 300.ms),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      style: TextStyle(fontSize: 16, color: Colors.black87),
      enabled: !_otpSent,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Phone number is required';
        }
        if (val.length < 10) {
          return 'Please enter a valid phone number';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your 10-digit phone number",
        labelStyle: TextStyle(color: textLightColor),
        prefixIcon: Icon(Icons.phone, color: primaryGreen),
        prefixText: "+91 ",

        prefixStyle: TextStyle(color: Colors.black87, fontSize: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: textLightColor.withOpacity(0.5), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryGreen, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
      ),
    );
  }

  Widget _buildSendOTPButton() {
    return Container(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _sendOTP,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          foregroundColor: Colors.white,
          elevation: 2,
          shadowColor: primaryGreen.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: _isLoading
            ? SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        )
            : Text(
          "SEND VERIFICATION CODE",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildOTPFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            "Enter verification code",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: textDarkColor,
            ),
          ),
        ),
        TextFormField(
          controller: _otpController,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 18, color: Colors.black87, letterSpacing: 10),
          maxLength: 6,
          textAlign: TextAlign.center,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'OTP is required';
            }
            if (val.length < 6) {
              return 'Please enter complete OTP';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: "⚬ ⚬ ⚬ ⚬ ⚬ ⚬",
            hintStyle: TextStyle(fontSize: 18, letterSpacing: 15),
            counterText: "",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: textLightColor.withOpacity(0.5), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: primaryGreen, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
          ),
        ),
      ],
    );
  }

  Widget _buildResendOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _resendActive ? "Didn't receive the code? " : "Resend code in ",
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
        ),
        _resendActive
            ? TextButton(
          onPressed: () {
            setState(() {
              _timeLeft = 60;
              _resendActive = false;
              _startCountdown();
            });
            // Resend OTP logic
          },
          child: Text(
            "Resend",
            style: TextStyle(
              color: primaryGreen,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        )
            : Text(
          "$_timeLeft seconds",
          style: TextStyle(
            color: primaryGreen,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildVerifyButton() {
    return Container(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _verifyOTP,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          foregroundColor: Colors.white,
          elevation: 2,
          shadowColor: primaryGreen.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: _isLoading
            ? SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        )
            : Text(
          "Verify & Continue",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildSecurityNote() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.security,
            color: textDarkColor,
            size: 20,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Security Note",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: textDarkColor,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "We use phone verification to ensure account security and prevent duplicate accounts. Your number will not be shared with anyone.",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}