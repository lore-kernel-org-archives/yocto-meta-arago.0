Return-Path: <mrinmayee@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6084E529A2
	for <meta-arago@arago-project.org>;
	Thu,  5 Sep 2013 15:02:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r85F2onR008732
	for <meta-arago@arago-project.org>; Thu, 5 Sep 2013 10:02:50 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r85F2o0k027601
	for <meta-arago@arago-project.org>; Thu, 5 Sep 2013 10:02:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 5 Sep 2013 10:02:50 -0500
Received: from [172.24.157.63] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r85F2mMT026665	for
	<meta-arago@arago-project.org>; Thu, 5 Sep 2013 10:02:49 -0500
Message-ID: <52289D18.5040202@ti.com>
Date: Thu, 5 Sep 2013 20:32:48 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
References: <1378391192-24393-1-git-send-email-mrinmayee@ti.com>
In-Reply-To: <1378391192-24393-1-git-send-email-mrinmayee@ti.com>
X-Forwarded-Message-Id: <1378391192-24393-1-git-send-email-mrinmayee@ti.com>
Subject: [PATCH] configs: Lock down the GLSDK release 6.02.00.02
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
X-List-Received-Date: Thu, 05 Sep 2013 15:02:54 -0000
Content-Type: multipart/alternative;
	boundary="------------080201010000010002000001"

--------------080201010000010002000001
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit


	

	

	

	



Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 ....02.00-config.txt => glsdk-06.02.02-config.txt} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 copy configs/glsdk/{glsdk-06.02.00-config.txt => glsdk-06.02.02-config.txt} (89%)

diff --git a/configs/glsdk/glsdk-06.02.00-config.txt b/configs/glsdk/glsdk-06.02.02-config.txt
similarity index 89%
copy from configs/glsdk/glsdk-06.02.00-config.txt
copy to configs/glsdk/glsdk-06.02.02-config.txt
index 969bf55..edb85fc 100644
--- a/configs/glsdk/glsdk-06.02.00-config.txt
+++ b/configs/glsdk/glsdk-06.02.02-config.txt
@@ -2,9 +2,9 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
-meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,danny,DEV_SDK_06_02_00_01,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,danny,DEV_SDK_06_02_00_02,layers=meta-arago-distro:meta-arago-extras
 meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_02_00_01,layers=
+meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_02_00_02,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
 oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-- 
1.7.0.4




--------------080201010000010002000001
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-forward-container">
      <table class="moz-email-headers-table" border="0" cellpadding="0"
        cellspacing="0">
        <tbody>
          <tr>
            <th nowrap="nowrap" valign="BASELINE" align="RIGHT"><br>
            </th>
            <td><br>
            </td>
          </tr>
          <tr>
            <th nowrap="nowrap" valign="BASELINE" align="RIGHT"><br>
            </th>
            <td><br>
            </td>
          </tr>
          <tr>
            <th nowrap="nowrap" valign="BASELINE" align="RIGHT"><br>
            </th>
            <td><br>
            </td>
          </tr>
          <tr>
            <th nowrap="nowrap" valign="BASELINE" align="RIGHT"><br>
            </th>
            <td><br>
            </td>
          </tr>
        </tbody>
      </table>
      <br>
      <br>
      <pre>Signed-off-by: Mrinmayee Hingolikar <a class="moz-txt-link-rfc2396E" href="mailto:mrinmayee@ti.com">&lt;mrinmayee@ti.com&gt;</a>
---
 ....02.00-config.txt =&gt; glsdk-06.02.02-config.txt} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 copy configs/glsdk/{glsdk-06.02.00-config.txt =&gt; glsdk-06.02.02-config.txt} (89%)

diff --git a/configs/glsdk/glsdk-06.02.00-config.txt b/configs/glsdk/glsdk-06.02.02-config.txt
similarity index 89%
copy from configs/glsdk/glsdk-06.02.00-config.txt
copy to configs/glsdk/glsdk-06.02.02-config.txt
index 969bf55..edb85fc 100644
--- a/configs/glsdk/glsdk-06.02.00-config.txt
+++ b/configs/glsdk/glsdk-06.02.02-config.txt
@@ -2,9 +2,9 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
-meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,danny,DEV_SDK_06_02_00_01,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,danny,DEV_SDK_06_02_00_02,layers=meta-arago-distro:meta-arago-extras
 meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_02_00_01,layers=
+meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_02_00_02,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
 oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-- 
1.7.0.4

</pre>
      <br>
    </div>
    <br>
  </body>
</html>

--------------080201010000010002000001--
