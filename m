Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id B2C3C52B00
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 18:29:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LIT5kP035680
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 13:29:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534876146;
	bh=af5n8zlXt8eBvHBGBDSw4PuGupWW9/u7jjcm/KbeFnQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TX4hFdbCS37Ksk2bh/z9Svx5xee+xRQhUNLQ1P/VKL3nh8LaMO3fqTpFaA/IrK5QX
	Lh80bd1dbUk0t+FTyv7K4tthh7AxRlt3ifHZRL3ucZ/Hb7jxYApWcMg179Cfr7a786
	dIW/NTFz6kp9Sf0XA3ocJpU/tlIHA/jyhuXwfysw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LIT5bc015475
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 13:29:05 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 13:29:05 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 13:29:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LIT54c020355;
	Tue, 21 Aug 2018 13:29:05 -0500
Date: Tue, 21 Aug 2018 14:28:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180821182808.GN29422@beryl>
References: <1534515953-32644-1-git-send-email-j-stiffler@ti.com>
	<1534515953-32644-4-git-send-email-j-stiffler@ti.com>
	<20180820202541.GF29422@beryl>
	<f745de70-b831-7c20-fa3c-7f91ad285958@ti.com>
MIME-Version: 1.0
In-Reply-To: <f745de70-b831-7c20-fa3c-7f91ad285958@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [RFC 3/3] arago-prefs: enable SECONDARY_TOOLCHAIN
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
X-List-Received-Date: Tue, 21 Aug 2018 18:29:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 21, 2018 at 02:19:52PM -0400, Jacob Stiffler wrote:
> 
> 
> On 8/20/2018 4:25 PM, Denys Dmytriyenko wrote:
> >On Fri, Aug 17, 2018 at 10:25:53AM -0400, Jacob Stiffler wrote:
> >>* disable SECONDARY_TOOLCHAIN by default
> >>* For k3, configure the secondary toolchain as armv7a for the R5
> >>   cores.
> >>
> >>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>---
> >>  meta-arago-distro/conf/distro/include/arago-prefs.inc | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >>diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >>index c839c9a..4e3e221 100644
> >>--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >>+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >>@@ -1,6 +1,9 @@
> >>  # Set preferred Qt5 versions. Different namespace from Qt4, so no conflict
> >>  include conf/distro/include/qt5-versions.inc
> >>+SECONDARY_TARGET_ARCH = ""
> >>+SECONDARY_TARGET_ARCH_k3 = "armv7a"
> >Just a tiny comment here - this should probably go to arago.conf
> >
> >I reserve arago-prefs.inc for all the PREFERRED_PROVIDER/VERSION settings.
> 
> While making that change, I realized that this patch set focuses on the
> external linaro toolchain.
> 
> Would this method work with the internal GCC toolchain? Do I need to disable
> this if not using the external linaro toolchain?

Yeah, internal toolchain would be a problem. That would require building it 
twice, which doesn't work out of box. That's why I put all that knowledge 
inside toolchain-linaro.inc:
http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=2adff429c23bc46b828e3f5f5c3017b4cb5780ce

That's probably the best place for your setting to, as well as limiting it to 
meta-arago-distro.


> >>  # Use the latest version of ltp-ddt for kernel versions 3.8+
> >>  PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
> >>-- 
> >>2.7.4
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

