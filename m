Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 7D360529A5
	for <meta-arago@arago-project.org>;
	Wed, 19 Feb 2020 23:54:06 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01JNq7fw047580;
	Wed, 19 Feb 2020 17:52:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582156327;
	bh=qVEFG4rS+ktyo90LY5thC/HmcINWOBJIV9RDzFdn3AA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OETL0S3h2bOVi9MR1KEEu7Sx+V9DcFnHEGnCrEOcWrpec0KmsbpmqAoVGGscKkOEA
	ULpIipj8v6BrRMrVgGLrCJH9ssg/j4eLYyYdHPh/hYkYoIktlH0RF+KZOXGtBwsyub
	l1yC0IIyvqcjNkc4jT7hrV8ayLRlA/q84QN54nYw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01JNq7rO004668;
	Wed, 19 Feb 2020 17:52:07 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 19 Feb 2020 17:52:07 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 19 Feb 2020 17:52:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01JNq6S5008752;
	Wed, 19 Feb 2020 17:52:07 -0600
Date: Wed, 19 Feb 2020 18:52:06 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
Message-ID: <20200219235206.GX720@beryl>
References: <MEAPR01MB2567716832C5FA4F6E472CF2E5190@MEAPR01MB2567.ausprd01.prod.outlook.com>
	<SY2PR01MB2426BC6017DD8E113B166CB6E5160@SY2PR01MB2426.ausprd01.prod.outlook.com>
	<SY2PR01MB24265CF57E3A14572D8434B7E5100@SY2PR01MB2426.ausprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SY2PR01MB24265CF57E3A14572D8434B7E5100@SY2PR01MB2426.ausprd01.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [Thud branch][AM3354]OpenGL/QT font rendering problem - corrupt glyphs
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
X-List-Received-Date: Wed, 19 Feb 2020 23:54:07 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

That is quite strange. We are wrapping up our Thud support. But it was used 
in our products for about a year with rigorous testing and we haven't seen 
anything like that on any of our platforms.

This does look like some memory corruption - are you sure you have all the 
timings correctly? Have you also switched any of the low-level components, 
like U-boot, Linux kernel, etc.?

Denys


On Wed, Feb 19, 2020 at 07:04:12PM +0000, Ankur Tyagi wrote:
> Hi,
> 
> Is there anything can be done to fix it? Let me know if some more information needs to be shared in order to help with diagnosis.
> 
> Regards
> Ankur
> 
> 
> ________________________________
> From: meta-arago-bounces@arago-project.org <meta-arago-bounces@arago-project.org> on behalf of Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> Sent: Tuesday, February 18, 2020, 11:11 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [Thud branch][AM3354]OpenGL/QT font rendering problem - corrupt glyphs
> 
> Resending it as previous one didn’t made it to the mailing list
> 
> And we are stuck in production after upgrade to thud branch because of this issue, any help is appreciated
> 
> Regards
> Ankur
> 
> From: Ankur Tyagi
> Sent: Tuesday, 11 February 2020 12:39 PM
> To: meta-arago@arago-project.org
> Subject: [Thud branch][AM3354]OpenGL/QT font rendering problem - corrupt glyphs
> 
> Greetings,
> 
> I am using AM3354 processor. I just did a major Yocto upgrade from "daisy" to "thud" branch, and I noticed that some characters/glyphs happen to be slightly corrupt.
> The problem occurs randomly, but when a corrupted character is rendered multiple times on the screen, all of its instances are corrupted the same way.
> 
> It looks like this: https://ibb.co/LYP4JCx
> 
> I tried using various QT environment variables, but the only one that worked was QT_QUICK_BACKEND=software. However, this led to a very significant slowdown, so it's not an option.
> 
> I'm not using X11 or wayland. I'm not modifying the graphics drivers or the QT layer in any way.
> 
> Following are Qt environment variables on target:
> 
> export QT_QPA_EGLFS_INTEGRATION=none
> export QT_QUICK_CONTROLS_1_STYLE=Flat
> export QT_QPA_EGLFS_NO_LIBINPUT=1
> 
> Has anyone experienced similar problem? Is there any configuration detail I might be missing?
> 
> Regards,
> Ankur
> 
> ________________________________
> This email is confidential and may contain information subject to legal privilege. If you are not the intended recipient please advise us of our error by return e-mail then delete this email and any attached files. You may not copy, disclose or use the contents in any way. The views expressed in this email may not be those of Gallagher Group Ltd or subsidiary companies thereof.
> ________________________________
> 

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


