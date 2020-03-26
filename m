Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 99577529C9
	for <meta-arago@arago-project.org>;
	Thu, 26 Mar 2020 19:20:25 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02QJIFmO021160
	for <meta-arago@arago-project.org>; Thu, 26 Mar 2020 14:18:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1585250295;
	bh=o0dj76qiua63Tn/suREZHhyMJrbBucyTFyKswvAC+wg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=oYj2EKqUFoGCbBwTi3m+En+7H4sZi30VJ341hicJUsch5jr1b3E8UEOc+UKj9YlZj
	jK5hzHPMCOZf8OTIvd/b1/EZlWOTWYQkT8CQPsu3GGdiQiNyaJ/HuBT21rrww4DXVl
	7vrXfiDh/doB9c/Kcx11BtXAv95Sgzyw4TrqBOj8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02QJIFF1079415
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 26 Mar 2020 14:18:15 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 26 Mar 2020 14:18:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 26 Mar 2020 14:18:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02QJIE03062531;
	Thu, 26 Mar 2020 14:18:14 -0500
Date: Thu, 26 Mar 2020 15:18:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20200326191814.GL11867@beryl>
References: <1583358315-5293-1-git-send-email-j-stiffler@ti.com>
	<20200305212452.GK1628@beryl>
	<2a366adf-a32e-a1a2-3d8d-0a206b0f339e@ti.com>
	<20200306001514.GQ1628@beryl>
	<c424aa53-30c1-4f00-f648-e511bbacdc68@ti.com>
MIME-Version: 1.0
In-Reply-To: <c424aa53-30c1-4f00-f648-e511bbacdc68@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [zeus/master][PATCH] open62541: upgrade to version 1.0.1, other fixes
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
X-List-Received-Date: Thu, 26 Mar 2020 19:20:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Mar 06, 2020 at 09:53:46AM -0500, Jacob Stiffler wrote:
> 
> On 3/5/2020 7:15 PM, Denys Dmytriyenko wrote:
> >On Thu, Mar 05, 2020 at 04:49:05PM -0500, Jacob Stiffler wrote:
> >>On 3/5/2020 4:24 PM, Denys Dmytriyenko wrote:
> >>>Jake,
> >>>
> >>>Somehow this update has a really hard time getting built - it failed in the
> >>>same place with what looks like an our-of-memory error:
> >>>
> >>>| src_generated/open62541/namespace0_generated.c: In function ‘namespace0_generated’:
> >>>| src_generated/open62541/namespace0_generated.c:113178:15: note: variable tracking size limit exceeded with ‘-fvar-tracking-assignments’, retrying without
> >>>| 113178 | UA_StatusCode namespace0_generated(UA_Server *server) {
> >>>|        |               ^
> >>>| arm-none-linux-gnueabihf-gcc: fatal error: Killed signal terminated program lto1
> >>>| compilation terminated.
> >>>| lto-wrapper: fatal error: /opt/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-gcc returned 1 exit status
> >>>| compilation terminated.
> >>>| /opt/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld: error: lto-wrapper failed
> >>>
> >>>It was not specific to any platform or a build node - all platforms on all
> >>>build nodes have failed. I had to revert the update for now, as I needed to
> >>>release rc3 very quickly.
> >>>
> >>>Has this been tested? Any comments?
> >>I have built this for both am57xx-evm and am65xx-evm and nativesdk. I have
> >>also run-time tested this on x86 and am65x IDK.
> >>
> >>I did not ice that it took a significantly longer time to build with this
> >>update and noticed "lto1-ltrans" as the top hog of resources. I have only
> >>noticed this within OE. I do not notice any performance difference in the
> >>standalone build.
> >>
> >>I suspect this may be a result of enabling UA_NAMESPACE_ZERO=FULL, but I do
> >>not know why this is isolated to OE.
> >Thanks. Is it possible to disable UA_NAMESPACE_ZERO=FULL to see if it improves
> >the build resource demands? Is it one of the required features to be enabled?
> 
> This is something we want because it is required to make use of other
> standard model namespaces, such as OpcUaDi (device integration) and others.
> I can move this to the PACKAGECONFIG so it is more easily configured, but
> eventually we will need to determine how to make this work in our builds.

Jake,

Any more updates on this one?
Unfortunately, the old version now breaks on master with this error:
cc1: error: unrecognized command line option ‘-Wno-static-in-inline’ [-Werror]

And I started looking into this update again, but it's taking a very-very long 
time even when lto is disabled...

-- 
Denys

