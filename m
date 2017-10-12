Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id D3F6352A1C
	for <meta-arago@arago-project.org>;
	Thu, 12 Oct 2017 04:35:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9C4Yt7h031206
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 23:34:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507782895;
	bh=8VSdG7/pts0yKQV3p7gr9DBI8y060cbIm+Ix3NGvypk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Hiv8mfmTsp2TT8EwiJHmVaieDdYcr+CoxifSsIMptPtTGAS/8DlUM8kBb/c/V3NbF
	WGIWoOfDG7CaVTxect//r//4hVQuzDUZpK80ZW68BAmHL3X5+O+psZmihXRWoZfokh
	IE7SW3/1i7+bHi7Fc0YM9TvDjGenPkWa0otwsm90=
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9C4Yn1f028670
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 23:34:50 -0500
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9C4YleF022364
	for <meta-arago@arago-project.org>; Thu, 12 Oct 2017 10:04:48 +0530
Received: from [172.24.157.163] (172.24.157.163) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 12 Oct 2017 10:04:45 +0530
To: Denys Dmytriyenko <denys@ti.com>
References: <1507626126-149180-1-git-send-email-a0393906@ti.com>
	<20171011194528.GZ16210@edge>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <8ecb26ba-8319-1985-507d-c52087e8aff5@ti.com>
Date: Thu, 12 Oct 2017 10:04:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171011194528.GZ16210@edge>
X-Originating-IP: [172.24.157.163]
Cc: meta-arago@arago-project.org
Subject: Re: [krogoth 1/6] gstreamer1.0-*vpe: Update SRCREV
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
X-List-Received-Date: Thu, 12 Oct 2017 04:35:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

I have reviewed your suggestions to JJ. It is clear.

Will keep this in mind for future patches.

Regards

Karthik


On 12-Oct-17 1:15 AM, Denys Dmytriyenko wrote:
> I believe this is a consolidated set of backports from morty as well - see my
> comments to JJ in another thread about properly formatting them in the future.
>


