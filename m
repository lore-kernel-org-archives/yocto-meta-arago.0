Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A5977529EB
	for <meta-arago@arago-project.org>;
	Thu,  8 Jan 2015 06:34:27 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t086YPBq025468
	for <meta-arago@arago-project.org>; Thu, 8 Jan 2015 00:34:25 -0600
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t086YMsY019856
	for <meta-arago@arago-project.org>; Thu, 8 Jan 2015 12:04:24 +0530
Received: from [172.24.159.162] (172.24.159.162) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 8 Jan 2015 12:04:21 +0530
Message-ID: <54AE24ED.6000509@ti.com>
Date: Thu, 8 Jan 2015 12:04:21 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1420556002-20165-1-git-send-email-j-stiffler@ti.com>
	<20150106181856.GY4759@edge> <54ACA814.7040105@ti.com>
	<4B26FB5A64EBA14C87266869E037F958140D1B9A@DFLE09.ent.ti.com>
	<24B88602B5904F49971CAF899152529B34B91375@DBDE04.ent.ti.com>
	<20150107181231.GC4759@edge>
In-Reply-To: <20150107181231.GC4759@edge>
X-Originating-IP: [172.24.159.162]
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "R,
	Karthik" <karthik.ramanan@ti.com>
Subject: Re: [PATCH] packagegroup-arago-tisdk-multimedia: Remove dspdce-fw from dra7xx-evm.
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
X-List-Received-Date: Thu, 08 Jan 2015 06:34:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07-Jan-15 11:42 PM, Denys Dmytriyenko wrote:
> On Wed, Jan 07, 2015 at 07:31:41AM -0500, R, Karthik wrote:
>> Jake,
>>
>> ACK for this patch.
>>
>> Ok. I understand.
>>
>> But then we would need the specific SDKs to add either add the "opencl" or
>> "dspdce-fw" into the respective packagegroups as per their need.
>
>> I just confirmed that the arago-glsdk-multimedia-image includes the
>> dspdce-fw explicity.
>
> What do you mean includes it explicitly?
>
> So, this comes back to the original suggestion to include either of the 2 FW
> images conditionally - do you mean to handle this by SDK branding?
>

Denys,

This patch removes dspdce-fw from packagegroup-arago-tisdk-multimedia.bb

So for SDK's that are including this packagegroup, they will miss the 
dspdce-fw and so it will have to be added explicitly in some other 
packagegroup that is SDK specific.

Regards
Karthik

