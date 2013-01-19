Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by arago-project.org (Postfix) with ESMTPS id 1A7C552A92
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:06 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id j6so4956431oag.26
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=WS2hoNuJObFFjpFu0niTrrYsLlVcFsyQlbo21ue6hqQ=;
	b=s0w6PKdi1P0yb8WcR3rMnDr5uxtaPU21dP2IgSgP73++PrOz4twgWBmbCBlP19TyvX
	TN5R97muTw8r+s5Dgw6pcNnXrUo4+WVMmblKK8XnHlYlykVFvCg+edQki7wKdxTr+6ZI
	DsliGW+Nl0hyzsf8KZdDTy8Ug/AvzXL67UkqLNJUKuKOCIoLwOtOv/mlJaETAUEM0jOw
	5Wb5M2/aWs2eKnwsyZv4dFnhay9EtGALSlQ9CeOoWNH9AgVrMRf9VIl/PlaCT2OniRLM
	j8znV9nYglM7eGTsv4hjUS5zy3hwsRqjZtTOhsmFGN9NY6paq+mz3/6/jLGRIlGMyctC
	7SAg==
X-Received: by 10.60.172.113 with SMTP id bb17mr10772701oec.110.1358632325608; 
	Sat, 19 Jan 2013 13:52:05 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.04
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:04 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:27 -0600
Message-Id: <1358632316-12266-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 02/31] obexd: Add UTF16BE to UTF8 conversion patch
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:06 -0000

* Add "obexd: fix UTF conversions" from Arago.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../0001-obexd-fix-UTF-conversions.patch           |  118 ++++++++++++++++++++
 .../recipes-connectivity/obexd/obexd_0.34.bbappend |    6 +
 2 files changed, 124 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-fix-UTF-conversions.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/obexd/obexd_0.34.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-fix-UTF-conversions.patch b/meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-fix-UTF-conversions.patch
new file mode 100644
index 0000000..24d1958
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-fix-UTF-conversions.patch
@@ -0,0 +1,118 @@
+From 856e73619bc4ddf2d44e4b969d785c1afc0773a7 Mon Sep 17 00:00:00 2001
+From: Moosa <moosab@ti.com>
+Date: Tue, 13 Mar 2012 16:27:11 +0200
+Subject: [PATCH] obexd: fix UTF conversions
+
+* Implements the UTF16BE to UTF8 conversion
+
+The glib library may not support conversion from UTF16BE to UTF8 (which
+is needed to get the name of a file received in obexd), Specifically,
+when glib is complied to use native iconv which does not support it
+(and not use libiconv, GNU's iconv library, which does).
+
+Upstream-Status: Inappropriate [Needed only since glib doesn't have UTF conversion support]
+
+Signed-off-by: Moosa Baransi <moosab@ti.com>
+---
+ src/obex.c |   64 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
+ 1 files changed, 58 insertions(+), 6 deletions(-)
+
+diff --git a/src/obex.c b/src/obex.c
+index ab7125c..b0f6106 100644
+--- a/src/obex.c
++++ b/src/obex.c
+@@ -179,6 +179,61 @@ static struct {
+ 	{ 0xFF,					NULL			},
+ };
+ 
++#if __BYTE_ORDER == __LITTLE_ENDIAN
++	#define BETOH16(sh) ((sh>>8)|(sh<<8))
++#elif __BYTE_ORDER == __BIG_ENDIAN
++	#define BETOH16(sh) (sh)
++#else
++#error "Unknown byte order"
++#endif
++
++char *utf16be_to_utf8(const char *instr_ch, size_t inlen_ch)
++{
++	uint16_t *instr = (uint16_t*)instr_ch;
++	size_t inlen = inlen_ch / 2; 
++	uint16_t val,ext;
++	size_t in_i = 0, out_i = 0;
++	char *outstr = NULL;
++
++	if (inlen_ch % 2 != 0) {
++		error("%s(): odd number!",__func__);
++		return NULL;
++	}
++
++	outstr = g_malloc(inlen + 1);
++	if (outstr == NULL) {
++		error("%s(): g_malloc failed",__func__);
++		return NULL;
++	}	
++
++	while (in_i < inlen) {
++		val = BETOH16(instr[in_i]); 
++		in_i++;
++		if ((val & 0xf800) == 0xd800) {	
++			if (in_i < inlen) {
++				error("%s(): cut short",__func__);
++				g_free(outstr);
++				return NULL;
++			}
++			ext = BETOH16(instr[in_i]);
++			in_i++;
++			if ( ((val & 0xfc00) != 0xd800) || 
++			     ((ext & 0xfc00) != 0xdc00) ) {
++				error("%s(): illegal sequence",
++					__func__);
++				g_free(outstr);
++				return NULL;
++			}
++			val = ((val & 0x3ff) << 10) + 
++				(ext & 0x3ff) + 0x10000;
++		}
++		outstr[out_i] = val;
++		out_i++;
++	}
++	outstr[out_i++] = '\x00';
++	return outstr;
++}
++
+ static void print_event(int evt, int cmd, int rsp)
+ {
+ 	const char *evtstr = NULL, *cmdstr = NULL, *rspstr = NULL;
+@@ -736,8 +791,7 @@ static void cmd_get(struct obex_session *os, obex_t *obex, obex_object_t *obj)
+ 			if (hlen == 0)
+ 				continue;
+ 
+-			os->name = g_convert((const char *) hd.bs, hlen,
+-					"UTF8", "UTF16BE", NULL, NULL, NULL);
++			os->name = utf16be_to_utf8((const char *) hd.bs, hlen);
+ 			DBG("OBEX_HDR_NAME: %s", os->name);
+ 			break;
+ 		case OBEX_HDR_TYPE:
+@@ -857,8 +911,7 @@ static void cmd_setpath(struct obex_session *os,
+ 			break;
+ 		}
+ 
+-		os->name = g_convert((const char *) hd.bs, hlen,
+-				"UTF8", "UTF16BE", NULL, NULL, NULL);
++		os->name = utf16be_to_utf8((const char *) hd.bs, hlen);
+ 
+ 		DBG("Set path name: %s", os->name);
+ 		break;
+@@ -954,8 +1007,7 @@ static gboolean check_put(obex_t *obex, obex_object_t *obj)
+ 			if (hlen == 0)
+ 				continue;
+ 
+-			os->name = g_convert((const char *) hd.bs, hlen,
+-					"UTF8", "UTF16BE", NULL, NULL, NULL);
++			os->name = utf16be_to_utf8((const char *) hd.bs, hlen);
+ 			DBG("OBEX_HDR_NAME: %s", os->name);
+ 			break;
+ 
+-- 
+1.7.1
+
diff --git a/meta-arago-distro/recipes-connectivity/obexd/obexd_0.34.bbappend b/meta-arago-distro/recipes-connectivity/obexd/obexd_0.34.bbappend
new file mode 100644
index 0000000..d51c9da
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/obexd/obexd_0.34.bbappend
@@ -0,0 +1,6 @@
+PR_append = "-arago0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
+
+SRC_URI += "file://0001-obexd-fix-UTF-conversions.patch \
+"
-- 
1.7.0.4


