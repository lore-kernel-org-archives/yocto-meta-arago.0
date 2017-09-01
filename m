Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 32A6552A05
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 17:17:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81HHQmX027687
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 12:17:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504286246;
	bh=x0qjUxQ6L3VqmbifK9WG6Y09XnaiM4aRNtK2BCRw5xw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=EWq/2i0f+eqq+djbo0ySzbJSm/6QABxumkVmmVRN4tf/7+w+oEI8R8o2Q94y4z1CR
	aoktsKGxMnFG7wRnTXeSux5KoIi/5c3lhpfRfGc4H7h8HEWNpjZQLS3NGeq7gxzuNj
	HvalOG7g0oJ3rMiS8K7zoYUX25pU7BgblEOwU7RY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81HHQDL009990
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 12:17:26 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 12:17:25 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 12:17:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81HHPPC023972;
	Fri, 1 Sep 2017 12:17:25 -0500
Date: Fri, 1 Sep 2017 13:17:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <a0850410@ti.com>
Message-ID: <20170901171720.GF8304@edge>
References: <1504022753-20132-1-git-send-email-e-ruei1@ti.com>
	<1504022753-20132-2-git-send-email-e-ruei1@ti.com>
	<20170829161745.GC8304@edge>
	<68c499e4-1b3e-3cf8-a023-3059ae7d16e8@ti.com>
	<20170829174810.GJ8304@edge>
	<69d759cb-3483-8424-5214-e909573bfb13@ti.com>
	<20170829212259.GS8304@edge>
MIME-Version: 1.0
In-Reply-To: <20170829212259.GS8304@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH 2/2] matrix-gui-apps-git: bump SRCREV for changes and additions
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
X-List-Received-Date: Fri, 01 Sep 2017 17:17:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 29, 2017 at 05:22:59PM -0400, Denys Dmytriyenko wrote:
> On Tue, Aug 29, 2017 at 02:12:47PM -0400, Ruei, Eric wrote:
> > On 8/29/2017 1:48 PM, Denys Dmytriyenko wrote:
> > >On Tue, Aug 29, 2017 at 01:33:11PM -0400, Ruei, Eric wrote:
> > >>On 8/29/2017 12:17 PM, Denys Dmytriyenko wrote:
> > >>>Eric,
> > >>>
> > >>>On Tue, Aug 29, 2017 at 12:05:53PM -0400, Eric Ruei wrote:
> > >>>>* replace webkit-based browsers with the webengine-based ones
> > >>>>* add HMI EVSE demo
> > >>>
> > >>>This hasn't been merged yet - see my comments yesterday.
> > >>>
> > >>>
> > >>Which one do you mean? Both of them are pushed at matrix-gui-v2-apps?
> > >
> > >HMI EVSE
> > >
> > >
> > I see Manisha's new patch also include matrix-gui-apps-git.
> > Therefore, I should update this patch on top of hers, right?
> 
> The new patch is not merged yet either.

Eric,

hmi evse has been merged, please rebase your patches and resubmit.


> > >>>>Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > >>>>Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> > >>>>---
> > >>>>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
> > >>>>  1 file changed, 2 insertions(+), 2 deletions(-)
> > >>>>
> > >>>>diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > >>>>index b805f5e..4d74224 100644
> > >>>>--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > >>>>+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > >>>>@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
> > >>>>  LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
> > >>>>  SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> > >>>>-SRCREV = "38afccb5335216ececa874cf4cf72a67c4164fc3"
> > >>>>+SRCREV = "d910584814644f853f3fe4fbe715f674f24b9bd3"
> > >>>>  BRANCH = "master"
> > >>>>-INC_PR = "r47"
> > >>>>+INC_PR = "r48"
> > >>>>  # Pull in the base package for installing matrix applications
> > >>>>  require matrix-gui-apps.inc
> > >>>>-- 
> > >>>>1.9.1
> > >>>>
> > >>>>_______________________________________________
> > >>>>meta-arago mailing list
> > >>>>meta-arago@arago-project.org
> > >>>>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >>
> > 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

