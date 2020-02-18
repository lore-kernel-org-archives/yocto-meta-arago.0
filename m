Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id D8CCF52994
	for <meta-arago@arago-project.org>;
	Tue, 18 Feb 2020 18:01:20 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01IHxMog084580;
	Tue, 18 Feb 2020 11:59:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582048762;
	bh=MlIY9ichWjCPZS++7Jg8Io3cDGNHSssgF1Xg1VZkCpI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=wAgCa+DdjqEDtAwazvFF2usGflbBP0WXLToE5yHEhEWagjlMR70lfXpuubLvS6kCP
	537NImAq91pkDOs9aktBFdGmyZjw2f2dIdIGlN4cbfitdFkel64z5Xs8iVsptKOSBZ
	o0c+4NsRo2WZtbJdB7y0Dfq7nnPhqAw/izoOn4T0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01IHxMaE117846
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Feb 2020 11:59:22 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 18 Feb 2020 11:59:22 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 18 Feb 2020 11:59:22 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01IHxMRh106654;
	Tue, 18 Feb 2020 11:59:22 -0600
Date: Tue, 18 Feb 2020 12:59:21 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Barker <pbarker@konsulko.com>
Message-ID: <20200218175921.GK720@beryl>
References: <CAM9ZRVsu3xHM4AS=8=Ver_j75inMAefZCH3231J6r6d1upg_tA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVsu3xHM4AS=8=Ver_j75inMAefZCH3231J6r6d1upg_tA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: SDK support in Arago with ARM toolchain
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
X-List-Received-Date: Tue, 18 Feb 2020 18:01:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 18, 2020 at 03:37:54PM +0000, Paul Barker wrote:
> Hi all,
> 
> I'm currently seeing several failures when trying to run `bitbake
> tisdk-rootfs-image -c populate_sdk` with the Arago distro and the
> external ARM toolchain enabled. Is this expected to be supported?

I have this patch pending:
http://arago-project.org/pipermail/meta-arago/2019-November/012088.html

It was part of a separate internal testing branch, which will be merged to 
zeus soon.

-- 
Denys

