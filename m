Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9C58B52A5B
	for <meta-arago@arago-project.org>;
	Wed,  3 Feb 2016 21:31:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u13LVvGT017698;
	Wed, 3 Feb 2016 15:31:58 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u13LVvav028785;
	Wed, 3 Feb 2016 15:31:57 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 3 Feb 2016 15:31:57 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u13LVuUT030988;
	Wed, 3 Feb 2016 15:31:57 -0600
Date: Wed, 3 Feb 2016 16:31:40 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20160203213139.GC31480@edge>
References: <1454533142-25375-1-git-send-email-denis@denix.org>
	<4B26FB5A64EBA14C87266869E037F95814216A1E@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F95814216A1E@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] tisdk-image: add packaging of skern and k2-fw-initrd to prebuilt-images/
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
X-List-Received-Date: Wed, 03 Feb 2016 21:31:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I have an immediate need to test Keystone nightly images with OpenTest, thus 
I'm adding missing artifacts to be able to do that.

I'm open to more generic approach in the future, of course.

-- 
Denys


On Wed, Feb 03, 2016 at 09:09:11PM +0000, Stiffler, Jacob wrote:
> I have a similar bbappend in meta-processor-sdk 
> (http://arago-project.org/git/projects/?p=meta-processor-sdk.git;a=blob;f=recipes-core/images/arago-core-tisdk-image.bbappend;h=f404874b03b090dd25ccb5a1459941d0d6f33e93;hb=HEAD).  
> I have not yet tried upstreaming it because I was hoping to think of a 
> better way to copy the increasing number of images to "prebuilt-images".
> 
> One thing missing here from what I have is copying the "u-boot.gph" to 
> prebuilt images. This is needed for keystone to be flashed to the board.
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Wednesday, February 03, 2016 3:59 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH] tisdk-image: add packaging of skern and k2-
> > fw-initrd to prebuilt-images/
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-arago-distro/classes/tisdk-image.bbclass | 26
> > +++++++++++++++++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-
> > distro/classes/tisdk-image.bbclass
> > index e5d5e50..86fbb58 100644
> > --- a/meta-arago-distro/classes/tisdk-image.bbclass
> > +++ b/meta-arago-distro/classes/tisdk-image.bbclass
> > @@ -56,6 +56,12 @@ DEPLOY_SPL_UART_NAME ?= "u-boot-spl.bin-
> > ${MACHINE}"
> >  # Variable to specify the name of the TI SCI firmware
> > DEPLOY_TISCI_FW_NAME ?= "ti-sci-firmware-k2g.bin"
> > 
> > +# Variable to specify the name of Keystone skern file (it has SOC in
> > +the name, not MACHINE) DEPLOY_K2_SKERN_NAME ?= "skern-*.bin"
> > +
> > +# Variable to specify the name of Keystone initramfs with FW images
> > +DEPLOY_K2_FW_INITRD_NAME ?= "k2-fw-initrd.cpio.gz"
> > +
> >  # Manifest file location which will be created as part of the image build  #
> > process.
> >  # This manifest follows the TI manifest format requirements which is why
> > @@ -758,15 +764,33 @@ tisdk_image_build () {
> >          fi
> >      fi
> > 
> > +    # Copy TI SCI firmware if it exists
> >      if [ "${DEPLOY_TISCI_FW_NAME}" != "" ]
> >      then
> > -        # Copy TI SCI firmware if it exists
> >          if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_TISCI_FW_NAME} ]
> >          then
> >              cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_TISCI_FW_NAME}
> > ${prebuilt_dir}/
> >          fi
> >      fi
> > 
> > +    # Copy skern/boot-monitor image if it exists
> > +    if [ "${DEPLOY_K2_SKERN_NAME}" != "" ]
> > +    then
> > +        if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_K2_SKERN_NAME} ]
> > +        then
> > +            cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_K2_SKERN_NAME}
> > ${prebuilt_dir}/
> > +        fi
> > +    fi
> > +
> > +    # Copy Keystone FW initramfs image if it exists
> > +    if [ "${DEPLOY_K2_FW_INITRD_NAME}" != "" ]
> > +    then
> > +        if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_K2_FW_INITRD_NAME} ]
> > +        then
> > +            cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_K2_FW_INITRD_NAME}
> > ${prebuilt_dir}/
> > +        fi
> > +    fi
> > +
> >      # Add the EXTRA_TISDK_FILES contents if they exist
> >      # Make sure EXTRA_TISDK_FILES is not empty so we don't accidentaly
> >      # copy the root directory.
> > --
> > 2.2.0
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

