Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 0A4E2529B1
	for <meta-arago@arago-project.org>;
	Tue,  3 Dec 2019 11:23:28 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB3BLvYH059541
	for <meta-arago@arago-project.org>; Tue, 3 Dec 2019 05:21:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575372117;
	bh=ZLuqWUeWj1GjUALwshdtzxnZq8ssCDLJjFEJwcUiFZc=;
	h=From:To:CC:Subject:Date;
	b=wy8lnUhLXuCngRf2qVdb75cisy+2xpi1+kV9JsXLnHqjYOf8WmmnBcw9rQ4kzg22S
	+WPT3KTCXPjgOD/HlJz2OkhcrBLBwDEdlIYbMDiPGHIzG3b86NU1WFnECaqtmjOhP2
	58JZ4bHERjIFCxnvs5Upb/83hImPpEIDfflesuJc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB3BLviu110122
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 3 Dec 2019 05:21:57 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 3 Dec 2019 05:21:56 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 3 Dec 2019 05:21:56 -0600
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB3BLudN058374;
	Tue, 3 Dec 2019 05:21:56 -0600
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Dec 2019 06:19:55 -0500
Message-ID: <20191203111955.19532-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [PATCHv2] armnn:ArmnnExample: Fix exception for '--help' command line option
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Dec 2019 11:23:29 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 ...-exception-for-help-command-line-opt.patch | 51 +++++++++++++++++++
 .../recipes-support/armnn/armnn_git.bb        |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0012-ArmnnExample-Fix-exception-for-help-command-line-opt.patch

diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0012-ArmnnExample-Fix-exception-for-help-command-line-opt.patch b/meta-arago-extras/recipes-support/armnn/armnn/0012-ArmnnExample-Fix-exception-for-help-command-line-opt.patch
new file mode 100644
index 00000000..bdd1312b
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0012-ArmnnExample-Fix-exception-for-help-command-line-opt.patch
@@ -0,0 +1,51 @@
+From 707ba3cba21c86d09cbb5f67ede565054b8c904d Mon Sep 17 00:00:00 2001
+From: Djordje Senicic <x0157990@ti.com>
+Date: Mon, 2 Dec 2019 16:56:27 -0500
+Subject: [PATCH] ArmnnExample: Fix exception for --help command line option
+
+Signed-off-by: Djordje Senicic <x0157990@ti.com>
+---
+ tests/ArmnnExamples/ArmnnExamples.cpp | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/tests/ArmnnExamples/ArmnnExamples.cpp b/tests/ArmnnExamples/ArmnnExamples.cpp
+index c10a4fc0..660106c0 100644
+--- a/tests/ArmnnExamples/ArmnnExamples.cpp
++++ b/tests/ArmnnExamples/ArmnnExamples.cpp
+@@ -213,6 +213,18 @@ namespace
+   // Configure boost::program_options for command-line parsing and validation.
+   namespace po = boost::program_options;
+ 
++  bool CheckOption(const po::variables_map& vm, const char* option)
++  {
++    // Check that the given option is valid.
++    if (option == nullptr)
++    {
++        return false;
++    }
++
++    // Check whether 'option' is provided.
++    return vm.find(option) != vm.end();
++  }
++
+   template<typename T, typename TParseElementFunc>
+   std::vector<T> ParseArrayImpl(std::istream& stream, TParseElementFunc parseElementFunc)
+   {
+@@ -647,6 +659,14 @@ int main(int argc, const char* argv[])
+     try
+     {
+       po::store(po::parse_command_line(argc, argv, desc), vm);
++      if (CheckOption(vm, "help") || argc <= 1)
++      {
++            std::cout << "Executes a neural network model using the provided video clip, or input camera stream. " << std::endl;
++            std::cout << "Runs many consecutive inferences and shows classification labels on display, in real-time." << std::endl;
++            std::cout << std::endl;
++            std::cout << desc << std::endl;
++            return EXIT_SUCCESS;
++      }
+       po::notify(vm);
+     }
+     catch (const po::error& e)
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
index f022ef9f..38571091 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
+++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
@@ -33,6 +33,7 @@ SRC_URI = " \
     file://0009-command-line-options-for-video-port-selection.patch \
     file://0010-armnnexamples-update-for-19.08-modifications.patch \
     file://0011-Generate-versioned-library-for-armnnTfLiteParser.patch \
+    file://0012-ArmnnExample-Fix-exception-for-help-command-line-opt.patch \
     http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=mobilenet;subdir=${WORKDIR}/tfmodel;destsuffix=tfmodel \
     https://storage.googleapis.com/mobilenet_v2/checkpoints/mobilenet_v2_1.0_224.tgz;name=mobilenetv2;subdir=${WORKDIR}/tfmodel;destsuffix=tfmodel \
     git://git.ti.com/tidl/tidl-api.git;name=tidl-api;branch=${BRANCH_tidl-api};subdir=${WORKDIR}/tidl-api;destsuffix=tidl-api \
-- 
2.17.1


