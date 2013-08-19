Return-Path: <a013216@uda0217541>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B3020529D0
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2013 05:51:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7J5pc1v012298
	for <meta-arago@arago-project.org>; Mon, 19 Aug 2013 00:51:38 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7J5pckh024592
	for <meta-arago@arago-project.org>; Mon, 19 Aug 2013 00:51:38 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 19 Aug 2013 00:51:38 -0500
Received: from udx0201389 ([172.24.190.133])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r7J5pbQl016186;
	Mon, 19 Aug 2013 00:51:38 -0500
Received: from a013216 by udx0201389 with local (Exim 4.76)	(envelope-from
	<a013216@uda0217541>)	id 1VBINN-0002dU-CL;
	Mon, 19 Aug 2013 11:21:37 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Aug 2013 11:21:28 +0530
Message-ID: <1376891490-10099-1-git-send-email-mrinmayee@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCHv2 0/2] Enable oe-layertool-setup.sh to use GLSDK branding
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
X-List-Received-Date: Mon, 19 Aug 2013 05:51:40 -0000
Content-Type: text/plain

v1:

 * In order to use GLSDK branding, a variable ARAGO_BRAND needs to be set
  in local.conf.
 * This patch set adds a conf.sample file for GLDK that contains the
  ARAGO_BRAND set to GLSDK branding, and edits the OECORELOCALCONF
  variable in GLSDK config to pick up the GLSDK conf.sample.
 * The oe-layertool-setup.sh would generate local.conf from the GLSDK conf.sample.

v2:
 
 * Copied conf.sample from AMSDK's conf.sample instead of copying from 
   local-arago-linaro.conf.sample.

Mrinmayee Hingolikar (2):
  configs : Override OECORELOCALCONF to use the glsdk.conf.sample
  sample-files: Added conf.sample file for GLSDK

 configs/glsdk/glsdk-06.01.00-config.txt |    2 +-
 sample-files/local-glsdk.conf.sample    |  162 +++++++++++++++++++++++++++++++
 2 files changed, 163 insertions(+), 1 deletion(-)
 create mode 100644 sample-files/local-glsdk.conf.sample

-- 
1.7.9.5


