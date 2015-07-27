Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6DE2F52991
	for <meta-arago@arago-project.org>;
	Mon, 27 Jul 2015 11:50:48 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t6RBok7Z008135
	for <meta-arago@arago-project.org>; Mon, 27 Jul 2015 06:50:47 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t6RBohvG030018
	for <meta-arago@arago-project.org>; Mon, 27 Jul 2015 17:20:45 +0530
Received: from [172.24.158.136] (172.24.158.136) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Mon, 27 Jul 2015 17:20:43 +0530
Message-ID: <55B61B13.3090607@ti.com>
Date: Mon, 27 Jul 2015 17:20:43 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1422426701-26910-1-git-send-email-nikhil.nd@ti.com>
	<E60A9E1B4132A24DB80BD56ABC92684735043FCF@DBDE04.ent.ti.com>
	<54C90AFB.9050302@ti.com> <20150724175601.GG1089@denix.org>
In-Reply-To: <20150724175601.GG1089@denix.org>
X-Originating-IP: [172.24.158.136]
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "R,
	Karthik" <karthik.ramanan@ti.com>
Subject: Re: [PATCH] packagegroup-arago-test: Update vpdma-fw and vpe-tests packages
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
X-List-Received-Date: Mon, 27 Jul 2015 11:50:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 24-Jul-15 11:26 PM, Denys Dmytriyenko wrote:
> Karthik, Nikhil,
>
> This split was done back in January, but now it causes a conflict, because
> both vpdma-fw and vpe-tests try to install the same firmware image. Do you
> know if vpe-tests Makefile needs to be updated to not install FW image, or we
> can do it in the recipe itself. How do you want to handle this?
>

Denys,

Can you please give some more details about the issue?
I just checked this on the latest nightly from GLSDK and I can see both 
vpdma-fw and vpe-tests included. We don't see the issue.

Regards
Karthik



