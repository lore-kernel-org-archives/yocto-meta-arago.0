Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by arago-project.org (Postfix) with SMTP id BE49152A66
	for <meta-arago@arago-project.org>;
	Fri, 13 Jun 2014 20:33:40 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 13 Jun 2014 22:33:38 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 35AF428B75C;
	Fri, 13 Jun 2014 22:33:39 +0200 (CEST)
From: Tudor Florea <tudor.florea@enea.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Jun 2014 22:33:37 +0200
Message-ID: <1402691617-62798-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 1/1] Add licenses path for the layer
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
X-List-Received-Date: Fri, 13 Jun 2014 20:33:41 -0000
Content-Type: text/plain

This patch solve the following:
WARNING: wl18xx-firmware: No generic license file exists for: TI-TSPA in any provider
Added the TI-TSPA license as it is found in the git repo in
wl18xx-firmware recipe

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 meta-arago-extras/conf/layer.conf         |    1 +
 meta-arago-extras/custom-licenses/TI-TSPA |   46 +++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-arago-extras/custom-licenses/TI-TSPA

diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index db98224..8e95aaa 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -10,3 +10,4 @@ BBFILE_PRIORITY_meta-arago-extras = "10"
 
 # Set a variable to get to the top of the metadata location
 ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
+LICENSE_PATH += "${LAYERDIR}/custom-licenses"
diff --git a/meta-arago-extras/custom-licenses/TI-TSPA b/meta-arago-extras/custom-licenses/TI-TSPA
new file mode 100644
index 0000000..b570993
--- /dev/null
+++ b/meta-arago-extras/custom-licenses/TI-TSPA
@@ -0,0 +1,46 @@
+   1 TECHNOLOGY AND SOFTWARE PUBLICLY AVAILABLE
+   2 SOFTWARE LICENSE
+   3 
+   4 Copyright (c) 2013, Texas Instruments Incorporated.
+   5 
+   6 All rights reserved.
+   7 
+   8 Redistribution.  
+   9 
+  10 Redistribution and use in binary form, without modification, are
+  11 permitted provided that the following conditions are met:
+  12 
+  13  * Redistributions must preserve existing copyright notices and reproduce 
+  14	this license (including the above copyright notice and the disclaimer below)
+  15	in the documentation and/or other materials provided with the distribution.
+  16 
+  17  * Neither the name of Texas Instruments Incorporated nor the names of 
+  18    its suppliers may be used to endorse or promote products derived 
+  19    from this software without specific prior written permission.
+  20 
+  21  * No reverse engineering, decompilation, or disassembly of this
+  22    software is permitted.
+  23 
+  24 Limited patent license.
+  25 
+  26 Texas Instruments Incorporated grants a world-wide, royalty-free, 
+  27 non-exclusive license under patents it now or hereafter owns or controls 
+  28 to make, have made, use, import, offer to sell and sell ("Utilize") this
+  29 software, but solely to the extent that any such patent is necessary
+  30 to Utilize the software alone.  The patent license shall not apply to
+  31 any combinations which include this software.  No hardware per se is
+  32 licensed hereunder.
+  33 
+  34 DISCLAIMER.
+  35 
+  36 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+  37 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+  38 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+  39 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+  40 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+  41 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+  42 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+  43 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+  44 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+  45 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+  46 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-- 
1.7.10.4


