Return-Path: <d-senicic1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 50A1652995
	for <meta-arago@arago-project.org>;
	Mon,  2 Dec 2019 22:05:15 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB2M3h0F010796
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2019 16:03:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575324223;
	bh=KJ0BlzDgLt18+gH8VufKns4FEhKF7RuI6jAJA3ySKVY=;
	h=From:To:CC:Subject:Date;
	b=cxAzcFM2leClbpt2oxbluSEtQlYo9fjRIu31w9WUKk9AqGtn/uIpWSJfIuRO8j7sY
	Df4RW0aCfrFy7vUY9NBpeAI+qhwrptlUoJzb0Q70kmOwiTPGLM3gtUwQLMitToVX4f
	bMoWru5/aRI64mUvf1RZ73D6R5+nm65k8pHCu/1g=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB2M3hof090951
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2019 16:03:43 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 2 Dec 2019 16:03:37 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 2 Dec 2019 16:03:37 -0600
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB2M3bdK002287;
	Mon, 2 Dec 2019 16:03:37 -0600
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 2 Dec 2019 17:01:37 -0500
Message-ID: <20191202220137.12783-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [PATCH] armnn:ArmnnExample: Fix exception for '--help' command line option
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
X-List-Received-Date: Mon, 02 Dec 2019 22:05:15 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 tests/ArmnnExamples/ArmnnExamples.cpp | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/ArmnnExamples/ArmnnExamples.cpp b/tests/ArmnnExamples/ArmnnExamples.cpp
index c10a4fc0..660106c0 100644
--- a/tests/ArmnnExamples/ArmnnExamples.cpp
+++ b/tests/ArmnnExamples/ArmnnExamples.cpp
@@ -213,6 +213,18 @@ namespace
   // Configure boost::program_options for command-line parsing and validation.
   namespace po = boost::program_options;
 
+  bool CheckOption(const po::variables_map& vm, const char* option)
+  {
+    // Check that the given option is valid.
+    if (option == nullptr)
+    {
+        return false;
+    }
+
+    // Check whether 'option' is provided.
+    return vm.find(option) != vm.end();
+  }
+
   template<typename T, typename TParseElementFunc>
   std::vector<T> ParseArrayImpl(std::istream& stream, TParseElementFunc parseElementFunc)
   {
@@ -647,6 +659,14 @@ int main(int argc, const char* argv[])
     try
     {
       po::store(po::parse_command_line(argc, argv, desc), vm);
+      if (CheckOption(vm, "help") || argc <= 1)
+      {
+            std::cout << "Executes a neural network model using the provided video clip, or input camera stream. " << std::endl;
+            std::cout << "Runs many consecutive inferences and shows classification labels on display, in real-time." << std::endl;
+            std::cout << std::endl;
+            std::cout << desc << std::endl;
+            return EXIT_SUCCESS;
+      }
       po::notify(vm);
     }
     catch (const po::error& e)
-- 
2.17.1


