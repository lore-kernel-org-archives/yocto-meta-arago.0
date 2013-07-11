Return-Path: <heroor@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id DE813529D3
	for <meta-arago@arago-project.org>;
	Thu, 11 Jul 2013 02:23:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6B2NGdR020130
	for <meta-arago@arago-project.org>; Wed, 10 Jul 2013 21:23:16 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6B2NFFS009997
	for <meta-arago@arago-project.org>; Wed, 10 Jul 2013 21:23:15 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 10 Jul 2013 21:23:15 -0500
Received: from [172.24.81.145] (h81-145.vpn.ti.com [172.24.81.145])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6B2ND1G021503;
	Wed, 10 Jul 2013 21:23:14 -0500
Message-ID: <51DE1710.1090305@ti.com>
Date: Thu, 11 Jul 2013 07:53:12 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <8EAE6244CE843044A42356038645C8551573366C@DFLE12.ent.ti.com>
	<8EAE6244CE843044A42356038645C85515733685@DFLE12.ent.ti.com>
	<20130710163214.GA16407@edge>
In-Reply-To: <20130710163214.GA16407@edge>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Senicic,
	Djordje" <d-senicic1@ti.com>
Subject: Re: Compiling gcc for A15 in Yocto
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
X-List-Received-Date: Thu, 11 Jul 2013 02:23:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/10/2013 10:02 PM, Denys Dmytriyenko wrote:
> On Wed, Jul 10, 2013 at 03:52:47PM +0000, Saran, Sajesh Kumar wrote:
>> I am not clear in last e-mail.
>>
>> We are trying to compile gcc for ARM in an X86 Ubuntu machine.
> 
> Sajesh,
> 
> If you use recent recipes in Yocto to build gcc from sources, it doesn't use 
> any git or svn repositories any more, but downloads a release tarball. I've 
> done it before and there's an easy way to enable it in Arago - just set 
> TOOLCHAIN_TYPE=internal
> 

Slightly related question. Is it possible to get tools-sdk as a
IMAGE_FEATURE? I haven't been able to do that successfully. We use the
Linaro 4.7 as an external toolchain, but having tools-sdk with
gcc-linaro-4.7 as the compiler running on the target is very useful.

Any tips/suggestions on how to go about adding it? I'll submit patches
once I get it in place, but I'm currently stuck at the start.

--
Sid

