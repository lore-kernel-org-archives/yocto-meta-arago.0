Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 73D6952A25
	for <meta-arago@arago-project.org>;
	Fri, 15 Dec 2017 19:48:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBFJmC16006542
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 13:48:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513367292;
	bh=/jpOBC59wPd2REaIahzaHM4pVvSCRTvocU1rIc36FEc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=bsSpycOwIah82pJVVXj9XHMvKg2IdNVoV4ZBFEIdHvlp3MTcYk1PJ2UCWRMEi/Kn4
	an+euudOILsTKFO21wS3vhdICGDxBWBimYPkkWhiNgNC+xebx8KX2tdcxRy9nbtnyG
	cvBuOFD0FuRlFly1EAW5xyqS2cn4Hdy3OAidYkKA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFJmCdc011402
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 13:48:12 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 15 Dec 2017 13:48:12 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 15 Dec 2017 13:48:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFJmCHl032012;
	Fri, 15 Dec 2017 13:48:12 -0600
Date: Fri, 15 Dec 2017 14:48:11 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Message-ID: <20171215194811.GA32237@edge>
References: <1513295086-1630-1-git-send-email-m-radhakrishnan2@ti.com>
	<b892ffe5-36b9-bcef-7836-0ce5d7254b66@ti.com>
	<0dc2b1265a174a898eaa8fb3ffb9d239@ti.com>
MIME-Version: 1.0
In-Reply-To: <0dc2b1265a174a898eaa8fb3ffb9d239@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH ] ti-pdk: Updates for dra7xx & am574x
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
X-List-Received-Date: Fri, 15 Dec 2017 19:48:13 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Dec 15, 2017 at 07:44:53PM +0000, Radhakrishnan, Mahesh wrote:
> [Machu] Is the below file the branding file?
> 
> ./meta-processor-sdk/conf/distro/include/branding-processor-sdk.inc

Yes.


> I couldn’t see any recipe including this file. Is the file name a reserved 
> one which is automatically picked up by Yocto?

No, it is controlled by ARAGO_BRAND="processor-sdk" variable and gets loaded 
by Arago distro config.

-- 
Denys

