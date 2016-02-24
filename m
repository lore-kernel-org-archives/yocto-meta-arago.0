Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1E5B352A4F
	for <meta-arago@arago-project.org>;
	Wed, 24 Feb 2016 20:12:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1OKC1JN012573
	for <meta-arago@arago-project.org>; Wed, 24 Feb 2016 14:12:01 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1OKC1ZY012610
	for <meta-arago@arago-project.org>; Wed, 24 Feb 2016 14:12:01 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 24 Feb 2016 14:12:00 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1OKC0CP019005;
	Wed, 24 Feb 2016 14:12:00 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aYfmy-0003Nd-3H; Wed, 24 Feb 2016 15:12:00 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 24 Feb 2016 15:11:55 -0500
Message-ID: <1456344717-12958-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Add ubi utils to devkit
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
X-List-Received-Date: Wed, 24 Feb 2016 20:12:02 -0000
Content-Type: text/plain

The is in preparation for adding a script to the SDK which can create
a ubi image from a root filesytem

Jacob Stiffler (2):
  mtd-utils: Extend to include the nativesdk class
  nativesdk-packagegroup-arago-sdk-host: Include ubifs utils

 .../packagegroups/nativesdk-packagegroup-arago-sdk-host.bb             | 3 ++-
 meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend          | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend

-- 
1.9.1


