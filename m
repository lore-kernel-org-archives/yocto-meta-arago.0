Return-Path: <heroor@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B467C529EA
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2013 15:47:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61Fldx6010111
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 10:47:40 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61Fldw7012254
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 10:47:39 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 10:47:39 -0500
Received: from ti.com (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with SMTP id r61Flc4e018424;
	Mon, 1 Jul 2013 10:47:38 -0500
Date: Mon, 1 Jul 2013 21:17:37 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20130701154737.GA1753@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH 0/2] Add arago-glsdk-console-image
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
X-List-Received-Date: Mon, 01 Jul 2013 15:47:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Create a packagegroup and corresponding filesystem image. 

Siddharth Heroor (2):
  packagegroups: Add new packagegroup for glsdk console
  images: Add new arago-glsdk-console-image

 .../images/arago-glsdk-console-image.bb            |   16 +++++++++
 .../packagegroup-arago-glsdk-console.bb            |   35 ++++++++++++++++++++
 2 files changed, 51 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-glsdk-console-image.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-glsdk-console.bb


