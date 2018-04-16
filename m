Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id D1A3E529BE
	for <meta-arago@arago-project.org>;
	Mon, 16 Apr 2018 22:12:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3GMCg9T008682
	for <meta-arago@arago-project.org>; Mon, 16 Apr 2018 17:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1523916762;
	bh=2dTba3wll1kAyvwACDjvd1ypZxo06V5mhyIESRjgqHs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Jz9iIS1xhp8WVUM3D4esvtU7MJOO3hVQ9WjD4UhgeFk5Hi2sZ0Ue6T8qnIWL+dxgZ
	MeBkU4fhQgBg/h70UhT2xa41aCzyM6oYcH5qywsVzy8DExZRvLBlpbSnXSsoK4Y9Ca
	JUhCbs7fYrBZytS2b++iHRjCGqGMNSVqQ5OnvRnY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3GMCgiq029919
	for <meta-arago@arago-project.org>; Mon, 16 Apr 2018 17:12:42 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 16 Apr 2018 17:12:41 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 16 Apr 2018 17:12:41 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3GMCfkd006425;
	Mon, 16 Apr 2018 17:12:41 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Apr 2018 18:12:35 -0400
Message-ID: <1523916755-32359-3-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523916755-32359-1-git-send-email-a0271529@ti.com>
References: <1523916755-32359-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [arm_benchmarks] [PATCH 2/2] dhrystone: fix compilation warnings
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
X-List-Received-Date: Mon, 16 Apr 2018 22:12:46 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 dhrystone/dhry.h   | 14 +++++++++++++-
 dhrystone/dhry_1.c | 18 ++++++------------
 dhrystone/dhry_2.c |  6 +++---
 3 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/dhrystone/dhry.h b/dhrystone/dhry.h
index f236e79..100e578 100755
--- a/dhrystone/dhry.h
+++ b/dhrystone/dhry.h
@@ -431,6 +431,8 @@
 
 #include <stdio.h>
                 /* for strcpy, strcmp */
+#include <string.h>
+#include <stdlib.h>
 
 #define Null 0 
                 /* Value of a Null pointer */
@@ -466,4 +468,14 @@ typedef struct record
           } variant;
       } Rec_Type, *Rec_Pointer;
 
-
+void Proc_1 ();
+void Proc_2 ();
+void Proc_3 ();
+void Proc_4 ();
+void Proc_5 ();
+void Proc_6 ();
+void Proc_7 ();
+void Proc_8 ();
+Enumeration Func_1 ();
+Boolean Func_2 ();
+Boolean Func_3 ();
diff --git a/dhrystone/dhry_1.c b/dhrystone/dhry_1.c
index 49c23cb..ef44f09 100644
--- a/dhrystone/dhry_1.c
+++ b/dhrystone/dhry_1.c
@@ -66,12 +66,6 @@ char            Ch_1_Glob,
 int             Arr_1_Glob [50];
 int             Arr_2_Glob [50] [50];
 
-extern char     *malloc (size_t size);
-extern char     *strcpy (char *destination, const char *source);
-
-Enumeration     Func_1 ();
-  /* forward declaration necessary since Enumeration may not simply be int */
-
 #ifndef REG
         Boolean Reg = false;
 #define REG
@@ -112,7 +106,7 @@ int             CpuFreq=0; // in KHz
 /* end of variables for time measurement */
 
 
-main (int argc, char **argv)
+void main (int argc, char **argv)
 /*****/
 
   /* main program, corresponds to procedures        */
@@ -346,7 +340,7 @@ main (int argc, char **argv)
 }
 
 
-Proc_1 (Ptr_Val_Par)
+void Proc_1 (Ptr_Val_Par)
 /******************/
 
 REG Rec_Pointer Ptr_Val_Par;
@@ -380,7 +374,7 @@ REG Rec_Pointer Ptr_Val_Par;
 } /* Proc_1 */
 
 
-Proc_2 (Int_Par_Ref)
+void Proc_2 (Int_Par_Ref)
 /******************/
     /* executed once */
     /* *Int_Par_Ref == 1, becomes 4 */
@@ -403,7 +397,7 @@ One_Fifty   *Int_Par_Ref;
 } /* Proc_2 */
 
 
-Proc_3 (Ptr_Ref_Par)
+void Proc_3 (Ptr_Ref_Par)
 /******************/
     /* executed once */
     /* Ptr_Ref_Par becomes Ptr_Glob */
@@ -418,7 +412,7 @@ Rec_Pointer *Ptr_Ref_Par;
 } /* Proc_3 */
 
 
-Proc_4 () /* without parameters */
+void Proc_4 () /* without parameters */
 /*******/
     /* executed once */
 {
@@ -430,7 +424,7 @@ Proc_4 () /* without parameters */
 } /* Proc_4 */
 
 
-Proc_5 () /* without parameters */
+void Proc_5 () /* without parameters */
 /*******/
     /* executed once */
 {
diff --git a/dhrystone/dhry_2.c b/dhrystone/dhry_2.c
index 11b8280..4d6b352 100644
--- a/dhrystone/dhry_2.c
+++ b/dhrystone/dhry_2.c
@@ -65,7 +65,7 @@ extern  int     Int_Glob;
 extern  char    Ch_1_Glob;
 
 
-Proc_6 (Enum_Val_Par, Enum_Ref_Par)
+void Proc_6 (Enum_Val_Par, Enum_Ref_Par)
 /*********************************/
     /* executed once */
     /* Enum_Val_Par == Ident_3, Enum_Ref_Par becomes Ident_2 */
@@ -99,7 +99,7 @@ Enumeration *Enum_Ref_Par;
 } /* Proc_6 */
 
 
-Proc_7 (Int_1_Par_Val, Int_2_Par_Val, Int_Par_Ref)
+void Proc_7 (Int_1_Par_Val, Int_2_Par_Val, Int_Par_Ref)
 /**********************************************/
     /* executed three times                                      */ 
     /* first call:      Int_1_Par_Val == 2, Int_2_Par_Val == 3,  */
@@ -119,7 +119,7 @@ One_Fifty      *Int_Par_Ref;
 } /* Proc_7 */
 
 
-Proc_8 (Arr_1_Par_Ref, Arr_2_Par_Ref, Int_1_Par_Val, Int_2_Par_Val)
+void Proc_8 (Arr_1_Par_Ref, Arr_2_Par_Ref, Int_1_Par_Val, Int_2_Par_Val)
 /*********************************************************************/
     /* executed once      */
     /* Int_Par_Val_1 == 3 */
-- 
1.9.1


