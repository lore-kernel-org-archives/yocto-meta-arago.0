Return-Path: <ceh@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id BDC6252A04
	for <meta-arago@arago-project.org>;
	Thu,  6 Dec 2012 22:23:27 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qB6MNQ4V000869
	for <meta-arago@arago-project.org>; Thu, 6 Dec 2012 16:23:26 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qB6MNQJ7017998
	for <meta-arago@arago-project.org>; Thu, 6 Dec 2012 16:23:26 -0600
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 6 Dec 2012 16:23:26 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	qB6MNQJ3028962;	Thu, 6 Dec 2012 16:23:26 -0600
Received: from dta0850405-ubuntu1 (dta0850405-ubuntu1.am.dhcp.ti.com
	[158.218.103.14])	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7)
	with ESMTP id qB6MNQw07559;	Thu, 6 Dec 2012 16:23:26 -0600 (CST)
Received: from [127.0.0.1] (localhost [127.0.0.1])	by dta0850405-ubuntu1
	(Postfix) with ESMTP id A5D82110604A;
	Thu,  6 Dec 2012 17:23:25 -0500 (EST)
Message-ID: <50C11ADD.5010803@ti.com>
Date: Thu, 6 Dec 2012 17:23:25 -0500
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <50BFA673.6040800@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C342343@DFLE09.ent.ti.com>
	<50C0FFE3.2090304@ti.com> <20121206203356.GD17596@denix.org>
In-Reply-To: <20121206203356.GD17596@denix.org>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH v2] Define arago-test-image
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
X-List-Received-Date: Thu, 06 Dec 2012 22:23:29 -0000
X-Groupsio-MsgNum: 660
Content-Type: multipart/mixed; boundary="------------050705060509040601080305"

--------------050705060509040601080305
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Please find v2 attached.

Thanks,
Carlos
On 12/06/2012 03:33 PM, Denys Dmytriyenko wrote:
> On Thu, Dec 06, 2012 at 03:28:19PM -0500, Carlos Hernandez wrote:
>> Franklin,
>>
>> That's a fair point. I did it to keep some independence between the
>> arago-test and arago-tisdk images but I'm OK including
>> task-arago-tisdk-addons instead of task-arago-test-addons. I guess we
>> could separate into different task files only if needed in the future.
>>
>> One task that will need to be added to task-arago-tisdk-addons is
>> bridge-utils.
>> bridge-utils is currently only included by task-arago-test-addons.
>>
>> Let me know if you are OK adding bridge-utils and I can submit another
>> patch with these changes.
> You could also add bridge-utils to your task-arago-test recipe.
>
> Or, you could just add bridge-utils besides the regular task-arago-tisdk-addons 
> to IMAGE_INSTALL in your test image recipe:
>
> IMAGE_INSTALL += "\
>     task-arago-base \
>     task-arago-console \
>     task-arago-base-tisdk \
>     task-arago-tisdk-connectivity \
>     task-arago-tisdk-crypto \
>     task-arago-tisdk-multimedia \
>     task-arago-tisdk-addons \
>     task-arago-test \
>     bridge-utils \
>     "
>
> Denys
>
>> Thanks for the review,
>> Carlos
>>
>> On 12/06/2012 02:30 PM, Cooper Jr., Franklin wrote:
>>> Can't task-arago-tisdk-addons be used instead of creating this new task-arago-test-addons recipe? The majority of the content in arago-test-addons is provided by task-arago-addons and the remainder is provided by tasks your pulling into the test image recipe. Other than having a slightly bloated file system with additional tools/libraries is there any reason you can't reuse some of the other tasks?
>>>
>>>> -----Original Message-----
>>>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>>>> bounces@arago-project.org] On Behalf Of Hernandez, Carlos
>>>> Sent: Wednesday, December 05, 2012 1:54 PM
>>>> To: meta-arago@arago-project.org
>>>> Subject: [meta-arago] [PATCH] Define arago-test-image
>>>>
>>>> This filesystem image includes test appplications used by Linux validation team.
>>>>
>>>> Please consider it for meta-arago project. Thanks, Carlos
>>>>
>>>>
>>>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>


--------------050705060509040601080305
Content-Type: text/x-patch; name="0001-Define-arago-test-image.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-Define-arago-test-image.patch"

From 390814230637c81f4c5e95b49f869d40857e3663 Mon Sep 17 00:00:00 2001
From: Carlos Hernandez <ceh@ti.com>
Date: Thu, 6 Dec 2012 17:31:45 -0500
Subject: [PATCH] Define arago-test-image

This filesystem image includes test appplications used by
Linux validation team.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../recipes-core/images/arago-test-image.bb        |   22 ++++++++++++++++++++
 .../recipes-core/tasks/task-arago-test-addons.bb   |   22 ++++++++++++++++++++
 2 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-test-image.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-test-addons.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-test-image.bb b/meta-arago-distro/recipes-core/images/arago-test-image.bb
new file mode 100644
index 0000000..3f52729
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/arago-test-image.bb
@@ -0,0 +1,22 @@
+# Arago System Test image
+# gives you test applications
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+require arago-image.inc
+
+COMPATIBLE_MACHINE = "omap3|dm365|omapl138|ti813x|ti814x|ti816x|omap4|ti33x"
+
+IMAGE_INSTALL += "\
+    task-arago-base \
+    task-arago-console \
+    task-arago-base-tisdk \
+    task-arago-tisdk-connectivity \
+    task-arago-tisdk-crypto \
+    task-arago-tisdk-multimedia \
+    task-arago-tisdk-addons \
+    task-arago-test \
+    task-arago-test-addons \
+    "
+
+export IMAGE_BASENAME = "arago-test-image"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-test-addons.bb b/meta-arago-distro/recipes-core/tasks/task-arago-test-addons.bb
new file mode 100644
index 0000000..00e9ff6
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-test-addons.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Task to install additional utilities/demos for test image"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+ALLOW_EMPTY = "1"
+
+inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+
+TEST_ADDONS = " \
+    bridge-utils \
+    "
+
+TEST_ADDONS_TI = " \
+    "
+
+RDEPENDS_${PN} = "\
+    ${TEST_ADDONS} \
+    ${TEST_ADDONS_TI} \
+    "
-- 
1.7.0.4


--------------050705060509040601080305--
