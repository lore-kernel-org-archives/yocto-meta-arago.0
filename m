Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id CF50C52998
	for <meta-arago@arago-project.org>;
	Thu,  1 Aug 2019 15:48:01 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x71Fl7pA114678
	for <meta-arago@arago-project.org>; Thu, 1 Aug 2019 10:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564674427;
	bh=AgBJHad83hhEz6N4wkqS2JlDWqcHk+FddGsVgSpJyRQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xrO9EU1JvGpPXx9q9w5Oyrk0tNf38lzoxF7tp20bRmRiF+RCsJXMmCsTjwlhmm930
	5W7OSSu9PAzcyGf8G9mZPLzkxqVgA0DWHCKPUARjUUDaD62jFogKUrU7sz2TZQvDvO
	pSO2sRmxYgWXdZ3ecswyXudTA70AThx+QbdGZ8h8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x71Fl7K0033021
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 1 Aug 2019 10:47:07 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 1 Aug 2019 10:47:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 1 Aug 2019 10:47:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x71Fl77R076649;
	Thu, 1 Aug 2019 10:47:07 -0500
Date: Thu, 1 Aug 2019 11:47:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190801154706.GE20944@beryl>
References: <1564665868-14785-1-git-send-email-j-stiffler@ti.com>
	<20190801154014.GD20944@beryl>
	<fc1a29eb-c333-0ddf-cc12-06cf3b537695@ti.com>
MIME-Version: 1.0
In-Reply-To: <fc1a29eb-c333-0ddf-cc12-06cf3b537695@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/thud][PATCH] packagegroup-arago-base: add avahi-utils along with zeroconf
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
X-List-Received-Date: Thu, 01 Aug 2019 15:48:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 01, 2019 at 11:45:54AM -0400, Jacob Stiffler wrote:
> 
> On 8/1/2019 11:40 AM, Denys Dmytriyenko wrote:
> >Not sure adding to the base is a good idea here...
> 
> 
> Makes sense. Do you have any suggestions? Maybe console, connectivity, or
> addons?

Yes, any of those sounds reasonable.


> >On Thu, Aug 01, 2019 at 09:24:28AM -0400, Jacob Stiffler wrote:
> >>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>---
> >>  meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> >>index 4094d90..cc601b0 100644
> >>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> >>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> >>@@ -31,7 +31,7 @@ ARAGO_EXTRA = "\
> >>  # minimal set of packages - needed to boot
> >>  RDEPENDS_${PN} = "\
> >>-    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'packagegroup-base-zeroconf', '',d)} \
> >>+    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'packagegroup-base-zeroconf avahi-utils', '',d)} \
> >>      ${@bb.utils.contains('MACHINE_FEATURES', 'alsa', '${ARAGO_ALSA_BASE}', '',d)} \
> >>      ${ARAGO_BASE} \
> >>      ${ARAGO_EXTRA} \
> >>-- 
> >>2.7.4
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

