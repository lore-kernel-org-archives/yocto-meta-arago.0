Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 8517352986
	for <meta-arago@arago-project.org>;
	Mon, 19 Oct 2020 19:59:26 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09JJuM22046509;
	Mon, 19 Oct 2020 14:56:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603137382;
	bh=wAfQSgBjbaJOovatNcEbeeA0u8rcVXNU/EMOacH8WLU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YsEhyOgmeLanBw5B4/wtHwwPwbKY0fAzi7E7CzIk51Vp+izST7ZDe1MThsCABdKPq
	q7Zf4H9WsnXZSA6/u/Tx2Dp3R2hB1b3tuumbyFe7haLMj1S8jmIsH74xtZQ46PVW2H
	apz/ZUxVmWon6Rexv9Bj4ZPCPcf5Vq1Y1m5lRyFo=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09JJuLBA130202
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Oct 2020 14:56:22 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 19 Oct 2020 14:56:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 19 Oct 2020 14:56:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09JJuLss018254;
	Mon, 19 Oct 2020 14:56:21 -0500
Date: Mon, 19 Oct 2020 15:56:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Barker <pbarker@konsulko.com>
Message-ID: <20201019195621.GF14852@beryl>
References: <20200621204349.363584-1-pbarker@konsulko.com>
	<20200629224351.GD6525@beryl> <20200630213041.GN7211@beryl>
	<20200814223055.GQ13081@beryl>
	<CAM9ZRVuOWAQssvFFPMUWm19nsN5NXXtgivbxecjjmXfGrUEp5w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVuOWAQssvFFPMUWm19nsN5NXXtgivbxecjjmXfGrUEp5w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell][PATCH] linux: copy-defconfig: Move do_create_srcipk only if defined
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
X-List-Received-Date: Mon, 19 Oct 2020 19:59:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 19, 2020 at 08:12:05PM +0100, Paul Barker wrote:
> On Fri, 14 Aug 2020 at 23:30, Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > Ping.
> >
> > In case this was missed - the submitted patch was causing a breakage and was
> > not merged. Thanks.
> 
> Hi Denys, I've not had a chance to get back to this one for a long
> time due to illness and other priorities coming up. I've finally taken
> a long look at it to find out why my builds were failing without this
> patch back in June but seem to be fine without it now. I somehow ended
> up with my CI system populating local.conf incorrectly so DISTRO was
> set to poky but all the arago layers were included. The resulting
> error messages were:
> 
> ERROR: /w/layers/meta-ti/recipes-kernel/linux/linux-ti-staging_5.4.bb:
> Task do_create_srcipk from
> /w/layers/meta-ti/recipes-kernel/linux/linux-ti-staging_5.4.bb seems
> to be empty?!
> ERROR: /w/layers/meta-ti/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb:
> Task do_create_srcipk from
> /w/layers/meta-ti/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb
> seems to be empty?!
> ERROR: /w/layers/meta-ti/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb:
> Task do_create_srcipk from
> /w/layers/meta-ti/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> seems to be empty?!
> 
> Should we support the case where the meta-arago-distro layer is
> included but a different DISTRO is chosen? If so I can resubmit this,
> the patch was broken as I mixed up the arguments to bb.build.addtask()
> so it's easy to fix.

Thanks, Paul.

Ultimately, it might be possible to support multi-distro setup and ensure that 
distro-specific changes only get applied if corresponding DISTRO is selected.
But, this hasn't been a priority when developing Arago distro - it started 
before Yocto Project came out, since OE Classic/Angstrom days.

On the other hand, meta-ti BSP does support usage in multi-BSP setups and 
extra care has been taken to ensure that. Not so much for meta-arago, 
unfortunately. So, right now including Arago distro with a different 
DISTRO setting is not officially support and is probably not something to 
be resolved in the near future.

-- 
Denys

