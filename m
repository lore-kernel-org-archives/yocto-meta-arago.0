Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9B223520EA
	for <meta-arago@arago-project.org>;
	Mon, 13 Oct 2014 15:15:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9DFFdSq010304
	for <meta-arago@arago-project.org>; Mon, 13 Oct 2014 10:15:39 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9DFFdkm001660
	for <meta-arago@arago-project.org>; Mon, 13 Oct 2014 10:15:39 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 13 Oct 2014 10:15:39 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s9DFFbdQ008178;	Mon, 13 Oct 2014 10:15:38 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 Oct 2014 20:40:49 +0530
Message-ID: <1413213050-7200-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [master PATCH v2 0/1] Updating IPUMM recipes to the latest
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
X-List-Received-Date: Mon, 13 Oct 2014 15:15:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Here is the link to the latest IPUMM recipe on meta-ti : http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
Here is the link to the patchworks for version v1 of new recipe: http://dflvsu0004.dal.design.ti.com/patch/10880/

* The recipe today supports both dra7xx and omap5.
* But GLSDK has dropped the support for omap5, starting from the 6.10.00.01 release. 
* Am assuming that the ipumm-fw recipe should continue to provide atleast the last supported firmware binary for OMAP5 which is why the older OMAP5 firmware binary is still referenced in the recipe.
* The firmware binaries have always been different. So we had this earlier approach of having two different recipes and then we decided to have a single recipe supporting both.
Link to the older recipe approach: http://arago-project.org/git/projects/meta-ti-glsdk.git?p=projects/meta-ti-glsdk.git;a=tree;f=recipes-ti/ipumm-fw;h=bcba55d8ac71890c5e53cda25c1d2b2eebe675b7;hb=6b80942da01d63a46567f3fe7b50bb1e945de1ba

Things to do:

* Add am57xx as compatible machine at a later time.
* Discuss about the python function that checks for the MMIP being defined in the MACHINE_FEATURES. Doesn’t this make it a two level indirection to support ipumm-fw?
What is the reason for introducing this? I would like to understand this further.


Karthik Ramanan (1):
  ipumm-fw: Updated ipumm firmware for latest IPC version

 ...umm-fw_3.00.04.02.bb => ipumm-fw_3.00.06.00.bb} |   25 ++++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)
 rename recipes-bsp/ipumm-fw/{ipumm-fw_3.00.04.02.bb => ipumm-fw_3.00.06.00.bb} (53%)

-- 
1.7.9.5


