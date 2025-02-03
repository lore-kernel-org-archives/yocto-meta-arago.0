Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE67C02193
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 08:17:57 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.83189.1738570669711951698
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 03 Feb 2025 00:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=swAQsPVl;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5138HjD12103694
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 02:17:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738570665;
	bh=XfqEGAm3i8Nl+5bxrmUsHpcvvYaiu2DNCaD/HEMSU2Y=;
	h=From:To:CC:Subject:Date;
	b=swAQsPVla5dIV4jPwzt0YqhMUTMtHtfRbGNc9zddcFPGUjTjlnxbsXlea8eLwp66o
	 fqd8PGVpXq9TQJjRTqzeF6WTJNEqiJZlPjSbJctrg7vGn4jkaqFhHfVeTDAY6Bit2/
	 4fCbeT3EHf1RxAZxRHK6ZBt8MVxG/VNRCCLgrWLk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5138HjQs044275
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 02:17:45 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 02:17:45 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 02:17:45 -0600
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5138HhTX002740;
	Mon, 3 Feb 2025 02:17:43 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <denis@denix.org>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-arago][master][PATCH v2] ti-test: Add mcrc64 test application
Date: Mon, 3 Feb 2025 13:47:22 +0530
Message-ID: <20250203081734.2561009-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 03 Feb 2025 08:17:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15790

From: Udit Kumar <u-kumar1@ti.com>

Add mcrc64 test application recipe.
This application is documented at[0].

[0]: https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-j722s/10_01_00_04/exports/docs/linux/Foundational_Components/Kernel/Kernel_Drivers/MCRC64.html

Signed-off-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
v2:
* Denys:
- Add required SUMMARY variable as per https://docs.yoctoproject.org/next/contributor-guide/recipe-style-guide.html#required-variables
---
 .../recipes-core/packagegroups/ti-test.bb     |   1 +
 .../recipes-kernel/mcrc64/files/mcrc64.c      | 114 ++++++++++++++++++
 .../recipes-kernel/mcrc64/mcrc64.bb           |  18 +++
 3 files changed, 133 insertions(+)
 create mode 100644 meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c
 create mode 100644 meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index 814e3ea6..1399a267 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -55,6 +55,7 @@ TI_TEST_BASE = "\
     tcpdump \
     v4l-utils \
     yavta \
+    mcrc64 \
 "
 
 TI_TEST_EXTRAS = " \
diff --git a/meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c b/meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c
new file mode 100644
index 00000000..fc7a75d6
--- /dev/null
+++ b/meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c
@@ -0,0 +1,114 @@
+/*
+ * Copyright (C) 2025 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ *
+ *  Redistribution and use in source and binary forms, with or without
+ *  modification, are permitted provided that the following conditions
+ *  are met:
+ *
+ *    Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ *    Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the
+ *    distribution.
+ *
+ *    Neither the name of Texas Instruments Incorporated nor the names of
+ *    its contributors may be used to endorse or promote products derived
+ *    from this software without specific prior written permission.
+ *
+ *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+*/
+
+#include <unistd.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/socket.h>
+#include <linux/if_alg.h>
+#include <string.h>
+
+#define BUFFER_SIZE 4096
+#define SECTOR 4096
+
+int main (int argc, char **argv) {
+
+    int desc[2] = { -1, -1 };
+
+    struct sockaddr_alg sock = {
+        .salg_family = AF_ALG,
+        .salg_type   = "hash",
+        .salg_name   = "crc64-iso3309"
+    };
+
+    if ((desc[0] = socket(AF_ALG, SOCK_SEQPACKET, 0)) == -1 ) {
+        perror("socket");
+        return -1;
+    }
+
+    if( bind(desc[0], (struct sockaddr *) &sock, sizeof(sock)) != 0 ) {
+        perror("bind");
+        return -1;
+    }
+
+    if( (desc[1] = accept(desc[0], NULL, 0)) == -1 )
+        return -1;
+
+    if (argc != 2 || strlen(argv[1]) == 0) {
+        printf("Please specify filename\n");
+        return -1; // empty string
+    }
+
+    FILE* file;
+    unsigned char *buffer;
+    if(posix_memalign((void *)&buffer, SECTOR, BUFFER_SIZE)) {
+        perror("posix_memalign failed");
+        return -1;
+    }
+
+    file = fopen(argv[1], "rb");
+    if(file == NULL)
+    {
+        printf("An error occured while opening file: %s\n", argv[1]);
+        free(buffer);
+        return -1;
+    }
+
+    while(!feof(file))
+    {
+        unsigned int count = fread(buffer, sizeof(char), BUFFER_SIZE, file);
+        if(ferror(file))
+        {
+            printf("An error occurred while accessing the file: %s\n", argv[1]);
+            fclose(file);
+            free(buffer);
+            return -1;
+        }
+
+        if (send(desc[1], buffer, count, MSG_MORE) != count) {
+            free(buffer);
+            return -1;
+        }
+    }
+
+    long int crc64 = 0x0000000000000000;
+    if(read(desc[1], &crc64, 8) != 8) {
+        free(buffer);
+        return -1;
+    }
+
+    printf("0x%llx\n", crc64);
+    free(buffer);
+    return 0;
+}
diff --git a/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb b/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb
new file mode 100644
index 00000000..a707430d
--- /dev/null
+++ b/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Application to test MCRC64 driver"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://mcrc64.c;beginline=1;endline=33;md5=070547e79367134fcfdf7fdb5e3ef7e3"
+
+SRC_URI = "file://mcrc64.c"
+
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
+do_compile() {
+	${CC} ${CFLAGS} ${LDFLAGS} ${UNPACKDIR}/mcrc64.c -o mcrc64
+}
+
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 mcrc64 ${D}${bindir}
+}
-- 
2.48.1


