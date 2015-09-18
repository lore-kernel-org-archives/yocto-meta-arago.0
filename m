Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 798445209B
	for <meta-arago@arago-project.org>;
	Fri, 18 Sep 2015 15:21:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8IFLiN8016401
	for <meta-arago@arago-project.org>; Fri, 18 Sep 2015 10:21:44 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8IFLibk004419
	for <meta-arago@arago-project.org>; Fri, 18 Sep 2015 10:21:44 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 18 Sep 2015 10:21:44 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8IFLioL029058;
	Fri, 18 Sep 2015 10:21:44 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZcxTr-0007Kd-NM; Fri, 18 Sep 2015 11:21:43 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 18 Sep 2015 11:21:39 -0400
Message-ID: <1442589699-28149-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [crypto-example-apps][PATCH] */Makefile: Explicitly link with -ldl
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
X-List-Received-Date: Fri, 18 Sep 2015 15:21:54 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 AES/Makefile              | 4 ++--
 Certificate_gen/Makefile  | 4 ++--
 Certificate_info/Makefile | 4 ++--
 Gen_public_key/Makefile   | 4 ++--
 SHA1/Makefile             | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/AES/Makefile b/AES/Makefile
index 6ce6928..c4b959a 100644
--- a/AES/Makefile
+++ b/AES/Makefile
@@ -45,7 +45,7 @@ BIN := AES_256
 #   ----------------------------------------------------------------------------
 OBJDIR_D := Debug
 BINDIR_D := $(OBJDIR_D)
-LIBS_D := $(LIBS) -lssl -lcrypto
+LIBS_D := $(LIBS) -ldl -lssl -lcrypto
 OBJS_D := $(SRCS:%.c=$(OBJDIR_D)/%.o)
 ALL_DEBUG := -g3 -gdwarf-2
 
@@ -54,7 +54,7 @@ ALL_DEBUG := -g3 -gdwarf-2
 #   ----------------------------------------------------------------------------
 OBJDIR_R := Release
 BINDIR_R := $(OBJDIR_R)
-LIBS_R := $(LIBS) -lssl -lcrypto
+LIBS_R := $(LIBS) -ldl -lssl -lcrypto
 OBJS_R := $(SRCS:%.c=$(OBJDIR_R)/%.o)
 ALL_RELEASE := -O3
 
diff --git a/Certificate_gen/Makefile b/Certificate_gen/Makefile
index 43d5120..ebff375 100644
--- a/Certificate_gen/Makefile
+++ b/Certificate_gen/Makefile
@@ -45,7 +45,7 @@ BIN := Certificate_gen
 #   ----------------------------------------------------------------------------
 OBJDIR_D := Debug
 BINDIR_D := $(OBJDIR_D)
-LIBS_D := $(LIBS) -lssl -lcrypto
+LIBS_D := $(LIBS) -ldl -lssl -lcrypto
 OBJS_D := $(SRCS:%.c=$(OBJDIR_D)/%.o)
 ALL_DEBUG := -g3 -gdwarf-2
 
@@ -54,7 +54,7 @@ ALL_DEBUG := -g3 -gdwarf-2
 #   ----------------------------------------------------------------------------
 OBJDIR_R := Release
 BINDIR_R := $(OBJDIR_R)
-LIBS_R := $(LIBS) -lssl -lcrypto
+LIBS_R := $(LIBS) -ldl -lssl -lcrypto
 OBJS_R := $(SRCS:%.c=$(OBJDIR_R)/%.o)
 ALL_RELEASE := -O3
 
diff --git a/Certificate_info/Makefile b/Certificate_info/Makefile
index 16acbbb..86bd5f4 100644
--- a/Certificate_info/Makefile
+++ b/Certificate_info/Makefile
@@ -45,7 +45,7 @@ BIN := Certificate_info
 #   ----------------------------------------------------------------------------
 OBJDIR_D := Debug
 BINDIR_D := $(OBJDIR_D)
-LIBS_D := $(LIBS) -lssl -lcrypto
+LIBS_D := $(LIBS) -ldl -lssl -lcrypto
 OBJS_D := $(SRCS:%.c=$(OBJDIR_D)/%.o)
 ALL_DEBUG := -g3 -gdwarf-2
 
@@ -54,7 +54,7 @@ ALL_DEBUG := -g3 -gdwarf-2
 #   ----------------------------------------------------------------------------
 OBJDIR_R := Release
 BINDIR_R := $(OBJDIR_R)
-LIBS_R := $(LIBS) -lssl -lcrypto
+LIBS_R := $(LIBS) -ldl -lssl -lcrypto
 OBJS_R := $(SRCS:%.c=$(OBJDIR_R)/%.o)
 ALL_RELEASE := -O3
 
diff --git a/Gen_public_key/Makefile b/Gen_public_key/Makefile
index f1947d7..ebca169 100644
--- a/Gen_public_key/Makefile
+++ b/Gen_public_key/Makefile
@@ -45,7 +45,7 @@ BIN := Gen_publickey
 #   ----------------------------------------------------------------------------
 OBJDIR_D := Debug
 BINDIR_D := $(OBJDIR_D)
-LIBS_D := $(LIBS) -lssl -lcrypto
+LIBS_D := $(LIBS) -ldl -lssl -lcrypto
 OBJS_D := $(SRCS:%.c=$(OBJDIR_D)/%.o)
 ALL_DEBUG := -g3 -gdwarf-2
 
@@ -54,7 +54,7 @@ ALL_DEBUG := -g3 -gdwarf-2
 #   ----------------------------------------------------------------------------
 OBJDIR_R := Release
 BINDIR_R := $(OBJDIR_R)
-LIBS_R := $(LIBS) -lssl -lcrypto
+LIBS_R := $(LIBS) -ldl -lssl -lcrypto
 OBJS_R := $(SRCS:%.c=$(OBJDIR_R)/%.o)
 ALL_RELEASE := -O3
 
diff --git a/SHA1/Makefile b/SHA1/Makefile
index 0f23d9e..e32d4d4 100644
--- a/SHA1/Makefile
+++ b/SHA1/Makefile
@@ -45,7 +45,7 @@ BIN := SHA1_test
 #   ----------------------------------------------------------------------------
 OBJDIR_D := Debug
 BINDIR_D := $(OBJDIR_D)
-LIBS_D := $(LIBS) -lssl -lcrypto
+LIBS_D := $(LIBS) -ldl -lssl -lcrypto
 OBJS_D := $(SRCS:%.c=$(OBJDIR_D)/%.o)
 ALL_DEBUG := -g3 -gdwarf-2
 
@@ -54,7 +54,7 @@ ALL_DEBUG := -g3 -gdwarf-2
 #   ----------------------------------------------------------------------------
 OBJDIR_R := Release
 BINDIR_R := $(OBJDIR_R)
-LIBS_R := $(LIBS) -lssl -lcrypto
+LIBS_R := $(LIBS) -ldl -lssl -lcrypto
 OBJS_R := $(SRCS:%.c=$(OBJDIR_R)/%.o)
 ALL_RELEASE := -O3
 
-- 
1.9.1


