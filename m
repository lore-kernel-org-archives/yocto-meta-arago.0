Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 76C2B5297D
	for <meta-arago@arago-project.org>;
	Wed, 19 Aug 2015 10:52:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7JAq1Od010271
	for <meta-arago@arago-project.org>; Wed, 19 Aug 2015 05:52:01 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7JAq1e9025659
	for <meta-arago@arago-project.org>; Wed, 19 Aug 2015 05:52:01 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 19 Aug 2015 05:52:00 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7JAq0dj001147;
	Wed, 19 Aug 2015 05:52:00 -0500
Message-ID: <55D45FD0.4020507@ti.com>
Date: Wed, 19 Aug 2015 06:52:00 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1439552740-15530-1-git-send-email-j-stiffler@ti.com>
	<20150818205706.GD6542@edge>
In-Reply-To: <20150818205706.GD6542@edge>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] tisdk-image: Use "TOOLCHAIN_SUFFIX" to find devkit
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
X-List-Received-Date: Wed, 19 Aug 2015 10:52:04 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 8/18/2015 4:57 PM, Denys Dmytriyenko wrote:
> Jake,
>
> This one didn't apply even on daisy - I didn't have much time to look at the
> issue, but maybe you have an idea what's wrong?
>


Denys,

I developed this patch in the fido context, and should apply cleanly on 
the master branch.

On fido, there is the commit 1ed881223402fdb1ab7f4ffe444d8b4e7f67cb34 to 
make the SDK filter stricter. This has not been implemented on daisy, 
and causes the patch to fail.

- Jake

