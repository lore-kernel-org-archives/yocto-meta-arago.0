Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id DCC1952970
	for <meta-arago@arago-project.org>;
	Tue, 25 Apr 2017 09:16:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3P9G260023786
	for <meta-arago@arago-project.org>; Tue, 25 Apr 2017 04:16:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493111762;
	bh=KcvQdako+KrBoABoFfta2DjkDARKQAS4ZyHsb60SCfQ=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=ZwlhOO3AnQ57vVQBgi2LE0IqZeWlzPg+CziLdUjhFCPMUiNAu+Qq++29yJO37dGm6
	uDAieUJzNsd5a+ytxCEA6PEI04IhF2csF5qiza8eDIoYk+ThmUqUYVDx9K/ZLnpbwH
	hwj3NZs51LJZhL55cnsfnKcdNWMjddtvpBMDDuik=
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3P9G1oT022007
	for <meta-arago@arago-project.org>; Tue, 25 Apr 2017 04:16:02 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3P9FxDs031015
	for <meta-arago@arago-project.org>; Tue, 25 Apr 2017 14:46:00 +0530
Received: from [172.24.159.169] (172.24.159.169) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Apr 2017 14:45:58 +0530
To: Denys Dmytriyenko <denys@ti.com>
References: <1492704863-125562-1-git-send-email-a0393906@ti.com>
	<20170424170439.GA24846@edge>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <58FF13CB.6060700@ti.com>
Date: Tue, 25 Apr 2017 14:45:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <20170424170439.GA24846@edge>
X-Originating-IP: [172.24.159.169]
Cc: meta-arago@arago-project.org
Subject: Re: [morty 1/2] wayland-ivi-extension: add recipe
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
X-List-Received-Date: Tue, 25 Apr 2017 09:16:03 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Comments inlined.

Regards
Karthik

On 24-Apr-17 10:34 PM, Denys Dmytriyenko wrote:
> On Thu, Apr 20, 2017 at 09:44:22PM +0530, Karthik Ramanan wrote:
>> This recipe is primarily adapted from the meta-agl.
>> URL reference: https://goo.gl/m0LLmT
>>
>> The recipe brings in the capability to use the ivi-shell
>> feature of the Weston and provides utilities to manage
>> the screens, layers and surfaces.
>>
>> force-type-conversion.patch overlayed in the recipe is required
>> to address a compilation issue seen only with TI graphics
>> stack.
>>
>> The other patches are required on top of the 1.11.0 version to
>> fully use the multiple screen features on TI platforms.
>>
>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>> ---
>>   ...-add-surfaces-Add-screenId-as-an-argument.patch | 101 +++++++++++++++++++++
>>   ...yer-add-surfaces-surface-layer-management.patch |  69 ++++++++++++++
>>   .../force-type-conversion.patch                    |  13 +++
>>   .../wayland/wayland-ivi-extension_1.11.0.bb        |  33 +++++++
>>   4 files changed, 216 insertions(+)
>>   create mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-surfaces-Add-screenId-as-an-argument.patch
>>   create mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surfaces-surface-layer-management.patch
>>   create mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch
>>   create mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb
>>
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-surfaces-Add-screenId-as-an-argument.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-surfaces-Add-screenId-as-an-argument.patch
>> new file mode 100644
>> index 0000000..b8afc0d
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-surfaces-Add-screenId-as-an-argument.patch
>> @@ -0,0 +1,101 @@
>> +From 0a368e3d65f3f3cbe193e9e4c6b7b7ddf4ec7b54 Mon Sep 17 00:00:00 2001
>> +From: Ramprasad N <x0038811@ti.com>
>> +Date: Thu, 20 Apr 2017 13:24:20 +0530
>> +Subject: [PATCH 1/2] layer-add-surfaces: Add screenId as an argument
>> +
>> +Add Screen_ID as a argument to handle multiple screens.
>> +Removed choose_screen function as it is redundant
>> +after this change
>> +
>> +Signed-off-by: Ramprasad N <x0038811@ti.com>
>> +Reviewed-by: Karthik Ramanan <a0393906@ti.com>
>> +---
>> + .../layer-add-surfaces/src/layer-add-surfaces.c    | 47 +++++-----------------
>> + 1 file changed, 11 insertions(+), 36 deletions(-)
>> +
>> +diff --git a/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c b/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
>> +index aaff7de..46d7d15 100644
>> +--- a/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
>> ++++ b/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
>> +@@ -32,6 +32,7 @@
>> +
>> + t_ilm_uint screenWidth;
>> + t_ilm_uint screenHeight;
>> ++t_ilm_uint screen_ID;
>> + t_ilm_uint layer;
>> + pthread_mutex_t mutex;
>> + static pthread_cond_t  waiterVariable = PTHREAD_COND_INITIALIZER;
>> +@@ -91,48 +92,20 @@ static void callbackFunction(ilmObjectType object, t_ilm_uint id, t_ilm_bool cre
>> +     }
>> + }
>> +
>> +-/* Choose the display with the largest resolution.*/
>> +-static t_ilm_uint choose_screen(void)
>> ++int main (int argc, const char * argv[])
>> + {
>> +     struct ilmScreenProperties screenProperties;
>> +-    t_ilm_uint* screen_IDs = NULL;
>> +-    t_ilm_uint screen_ID = 0;
>> +-    t_ilm_uint screen_count = NULL;
>> +-    t_ilm_uint choosen_width = 0;
>> +-    t_ilm_uint choosen_height = 0;
>> +-    int i;
>> +-
>> +-    ilm_getScreenIDs(&screen_count, &screen_IDs);
>> +-
>> +-    for (i = 0; i<screen_count; i++)
>> +-    {
>> +-        ilm_getPropertiesOfScreen(screen_IDs[i], &screenProperties);
>> +-        if (screenProperties.screenWidth > choosen_width) {
>> +-            choosen_width = screenProperties.screenWidth;
>> +-            choosen_height = screenProperties.screenHeight;
>> +-            screen_ID = screen_IDs[i];
>> +-        }
>> +-    }
>> +
>> +-    screenWidth = choosen_width;
>> +-    screenHeight = choosen_height;
>> +-
>> +-    free(screen_IDs);
>> +-
>> +-    return screen_ID;
>> +-}
>> +-
>> +-int main (int argc, const char * argv[])
>> +-{
>> +     // Get command-line options
>> +-    if ( argc != 3) {
>> +-        printf("Call layer-add-surface <layerID> <number_of_surfaces>\n");
>> ++    if ( argc != 4) {
>> ++        printf("Call layer-add-surface <screenID> <layerID> <number_of_surfaces>\n");
>> +         return -1;
>> +     }
>> +
>> +-    layer = strtol(argv[1], NULL, 0);
>> ++    screen_ID = strtol(argv[1], NULL, 0);
>> ++    layer = strtol(argv[2], NULL, 0);
>> +
>> +-    number_of_surfaces = strtol(argv[2], NULL, 0);
>> ++    number_of_surfaces = strtol(argv[3], NULL, 0);
>> +
>> +     pthread_mutexattr_t a;
>> +     if (pthread_mutexattr_init(&a) != 0)
>> +@@ -156,11 +129,13 @@ int main (int argc, const char * argv[])
>> +     pthread_mutexattr_destroy(&a);
>> +
>> +     t_ilm_layer renderOrder[1];
>> +-    t_ilm_uint screen_ID;
>> +     renderOrder[0] = layer;
>> +     ilm_init();
>> +
>> +-    screen_ID = choose_screen();
>> ++    ilm_getPropertiesOfScreen(screen_ID, &screenProperties);
>> ++    screenWidth = screenProperties.screenWidth;
>> ++    screenHeight = screenProperties.screenHeight;
>> ++    printf("GetPropertiesOfScreen: screen ID (%d), Width (%u), Height (%u)\n", screen_ID, screenWidth, screenHeight);
>> +     ilm_layerCreateWithDimension(&layer, screenWidth, screenHeight);
>> +     printf("CreateWithDimension: layer ID (%d), Width (%u), Height (%u)\n", layer, screenWidth, screenHeight);
>> +     ilm_layerSetVisibility(layer,ILM_TRUE);
>> +--
>> +1.9.1
>> +
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surfaces-surface-layer-management.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surfaces-surface-layer-management.patch
>> new file mode 100644
>> index 0000000..eff4a79
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surfaces-surface-layer-management.patch
>> @@ -0,0 +1,69 @@
>> +From 0d164d686147d2d3b08cd79ef9930f62ff8d528b Mon Sep 17 00:00:00 2001
>> +From: Ramprasad N <x0038811@ti.com>
>> +Date: Thu, 20 Apr 2017 13:30:31 +0530
>> +Subject: [PATCH 2/2] layer-add-surfaces: surface-layer management
>> +
>> +This patch prevents surfaces from getting added to a new layer
>> +if they are already registered to an existing layer.
>> +
>> +Signed-off-by: Ramprasad N <x0038811@ti.com>
>> +Reviewed-by: Karthik Ramanan <a0393906@ti.com>
>> +---
>> + .../layer-add-surfaces/src/layer-add-surfaces.c    | 35 ++++++++++++++++++++--
>> + 1 file changed, 33 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c b/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
>> +index 46d7d15..cc76117 100644
>> +--- a/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
>> ++++ b/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
>> +@@ -59,14 +59,45 @@ static void surfaceCallbackFunction(t_ilm_uint id, struct ilmSurfaceProperties*
>> +         configure_ilm_surface(id, sp->origSourceWidth, sp->origSourceHeight);
>> +     }
>> + }
>> +-
>> + static void callbackFunction(ilmObjectType object, t_ilm_uint id, t_ilm_bool created, void *user_data)
>> + {
>> +     (void)user_data;
>> +     struct ilmSurfaceProperties sp;
>> ++    t_ilm_int llength, slength, i, j;
>> ++    t_ilm_uint* layerIDs = NULL;
>> ++    t_ilm_uint* surfaceIDs = NULL;
>> ++    t_ilm_bool addRequired = ILM_TRUE;
>> +
>> +     if (object == ILM_SURFACE) {
>> +-        if (created) {
>> ++        ilm_getLayerIDs(&llength, &layerIDs);
>> ++
>> ++        if(llength > 1) {
>> ++            for(i=0; i < llength; i++) {
>> ++                if(layerIDs[i] != layer) {
>> ++                    ilm_getSurfaceIDsOnLayer(layerIDs[i], &slength, &surfaceIDs);
>> ++                    for(j=0; j < slength; j++){
>> ++                        if(surfaceIDs[j] == id){
>> ++                            addRequired = ILM_FALSE;
>> ++                            printf("surface %d is already attached to layer %d\n", id, layerIDs[i]);
>> ++                        }
>> ++
>> ++                    }
>> ++
>> ++                    if(surfaceIDs) {
>> ++                        free(surfaceIDs);
>> ++                    }
>> ++
>> ++                }
>> ++
>> ++            }
>> ++
>> ++        }
>> ++
>> ++        if(layerIDs) {
>> ++            free(layerIDs);
>> ++        }
>> ++
>> ++        if (created && addRequired) {
>> +             if (number_of_surfaces > 0) {
>> +                 number_of_surfaces--;
>> +                 printf("surface                : %d created\n",id);
>> +--
>> +1.9.1
>> +
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch
>> new file mode 100644
>> index 0000000..a72aeed
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch
>> @@ -0,0 +1,13 @@
>> +diff --git a/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp b/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp
>> +index 2e65864..e14dbc0 100644
>> +--- a/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp
>> ++++ b/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp
>> +@@ -244,7 +247,7 @@ bool OpenGLES2App::createEGLContext()
>> +     m_eglContextStruct.eglSurface = NULL;
>> +     m_eglContextStruct.eglContext = NULL;
>> +
>> +-    m_eglContextStruct.eglDisplay = eglGetDisplay(m_wlContextStruct.wlDisplay);
>> ++    m_eglContextStruct.eglDisplay = eglGetDisplay((EGLNativeDisplayType)m_wlContextStruct.wlDisplay);
>> +     eglstatus = eglGetError();
>> +     if (!m_eglContextStruct.eglDisplay)
>> +     {
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb
>> new file mode 100644
>> index 0000000..157e1ee
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb
>> @@ -0,0 +1,33 @@
>> +SUMMARY = "Wayland IVI Extension"
>> +DESCRIPTION = "GENIVI Layer Management API based on Wayland IVI Extension"
>> +HOMEPAGE = "http://projects.genivi.org/wayland-ivi-extension"
>> +BUGTRACKER = "http://bugs.genivi.org/enter_bug.cgi?product=Wayland%20IVI%20Extension"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1f1a56bb2dadf5f2be8eb342acf4ed79"
>> +
>> +SRCREV = "c9001582b10ce209c37b42dd560947c5aa8928b3"
>> +
>> +SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=http \
>> +           file://force-type-conversion.patch \
>> +           file://0001-layer-add-surfaces-Add-screenId-as-an-argument.patch \
>> +           file://0002-layer-add-surfaces-surface-layer-management.patch \
>> +    "
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +DEPENDS = "weston virtual/libgles2 pixman"
>> +
>> +inherit cmake
>> +
>> +EXTRA_OECMAKE := "-DWITH_ILM_INPUT=1"
>> +EXTRA_OECMAKE += "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
> What these 2 lines are doing? There's no need to use := in the first line. And
> in the second line, why so convoluted way - all it does is pass an empty string.
> Can these 2 lines be simplified and merged into one?
Few points:
a) This recipe section with is taken directly from the meta-agl 
reference that I provided.
b) The immediate variable expansion ":=", can be avoided but its fine to 
have right. Is there a recommended best practice?
c) You are right that the expansion results in an empty string, but I 
looked further into this and I see that such a usage is quite prevalent.
I don't quite understand the intended purpose. Can you please let me 
know what the intended purpose of this could be?
Again, I can change this but like I mentioned this is coming from the 
upstream recipe. Let me know what you think?

>
>> +
>> +PR = "r3"
>> +
>> +# Need these temporarily to prevent a non-fatal do_package_qa issue
>> +INSANE_SKIP_${PN} += "dev-deps"
>> +INSANE_SKIP_${PN}-dev += "dev-elf dev-so"
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


