Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9D6B0529D3
	for <meta-arago@arago-project.org>;
	Wed,  7 Jan 2015 12:44:59 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t07Civ5j016048
	for <meta-arago@arago-project.org>; Wed, 7 Jan 2015 06:44:58 -0600
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t07CitcG001174
	for <meta-arago@arago-project.org>; Wed, 7 Jan 2015 18:14:56 +0530
Received: from [172.24.159.162] (172.24.159.162) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 7 Jan 2015 18:14:53 +0530
Message-ID: <54AD2A44.9080607@ti.com>
Date: Wed, 7 Jan 2015 18:14:52 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1420549486-9379-1-git-send-email-a0393906@ti.com>
	<1420549486-9379-2-git-send-email-a0393906@ti.com>
	<20150106180301.GR4759@edge>
In-Reply-To: <20150106180301.GR4759@edge>
X-Originating-IP: [172.24.159.162]
Cc: meta-arago@arago-project.org
Subject: Re: [WILINK R8.5 2/2] wl18xx, bt-firmware: Update to R8.5
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
X-List-Received-Date: Wed, 07 Jan 2015 12:44:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 06-Jan-15 11:33 PM, Denys Dmytriyenko wrote:
> Karthik,
>
> You've dropped version from the filenames of all the WiLink components, but
> updated PV only in ti-compat-wireless. All other packages will go back to 0.0
> version due to missing PV. And since that version sorts lower, it won't be
> installed on top of the old version.
>

Denys,

Yes. This was intended, the decision was taken to drop the version names 
so that the recipes can be maintained in a easier manner.
Note that PV is not defined in many of these recipes.

I agree with your comment about the issue arising out of this missing PV 
update but since this issue will not arise from a clean build and that 
we don't have any customer on the dra7xx-evm at the moment who is on 
daisy. Can this be patch be taken in the current state?

Let me know if there are additional changes required, I will surely 
incorporate them.

Regards
Karthik

