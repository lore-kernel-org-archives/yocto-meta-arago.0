Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5383F52A5F
	for <meta-arago@arago-project.org>;
	Wed, 16 Mar 2016 18:35:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2GIZP2Z019075
	for <meta-arago@arago-project.org>; Wed, 16 Mar 2016 13:35:25 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2GIZP1H022601
	for <meta-arago@arago-project.org>; Wed, 16 Mar 2016 13:35:25 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Mar 2016 13:35:24 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2GIZOcZ014999;
	Wed, 16 Mar 2016 13:35:24 -0500
Message-ID: <56E9A76C.1020607@ti.com>
Date: Wed, 16 Mar 2016 14:35:24 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
	<56E9A40C.6080704@ti.com> <20160316182508.GD29659@edge>
In-Reply-To: <20160316182508.GD29659@edge>
Cc: meta-arago@arago-project.org, xuj@ti.com
Subject: Re: [PATCH 0/8] Add LibArch and LinAlg
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
X-List-Received-Date: Wed, 16 Mar 2016 18:35:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 3/16/2016 2:25 PM, Denys Dmytriyenko wrote:
> Jake,
>
> I was on the fence about this particular set. What are your requirement and
> priority here?
>

I was really hoping to get this in sooner, but the sources were just 
pushed external.

This is a requirement for our next release, so if it does not make it 
in, then I will need to rework this for meta-processor-sdk.

